import re
from cst import mass

class MaterialSolver:

    def __init__(self):
        pass

    def initialize(self):

        materials = self.read_material()
        microxs = self.read_xs()
        materials = self.get_macroxs(materials, microxs)
        materials = self.get_diffusion_coefficient(materials)
        print(materials)
        return materials


    def get_diffusion_coefficient(self, materials):

        for m in materials:
            mu0 = self.get_avg_cosine(materials[m])
            materials[m]['diffusion_coefficient'] = 1 / (3 * (materials[m]['macrosig']['abs']
                                                              + materials[m]['macrosig']['sca'] * (1 - mu0)))
        return materials

    @staticmethod
    def get_avg_cosine(materials):
        avg_mass_number = 0
        for isotope in materials['isotopes']:
            # Careful, this multiplies by weight percent, not atomic percent
            avg_mass_number += mass.atomic[isotope] * materials['isotopes'][isotope]
        return 2 / (3 * avg_mass_number)

    @staticmethod
    def get_macroxs(materials, cross_sections):
        for m in materials:
            rho_glob = materials[m]['density']
            avogadro = 6.022e23
            macrosig_a = 0
            macrosig_s = 0
            macrosig_f = 0
            for isotope in materials[m]['isotopes']:
                n_mat = rho_glob * materials[m]['isotopes'][isotope] * avogadro / mass.masses[isotope]
                macrosig_a += n_mat * cross_sections[isotope]['abs']
                macrosig_s += n_mat * cross_sections[isotope]['sca']
                macrosig_f += n_mat * cross_sections[isotope]['fis']
            materials[m]['macrosig'] = {'abs': macrosig_a, 'sca': macrosig_s, 'fis': macrosig_f}
        return materials


    @staticmethod
    def read_xs():

        xs = {}
        with open('dat/xs.txt', 'r') as dat:
            for xsline in dat.readlines():
                if xsline.startswith('#'):
                    continue
                xsline = xsline.split(';')
                xs[xsline[0]] = {'abs': float(xsline[1]) * 1e-24,
                                 'sca': float(xsline[2]) * 1e-24,
                                 'fis': float(xsline[3]) * 1e-24}

        return xs


    @staticmethod
    def read_material():

        with open('dat/geometry.txt', 'r') as dat:
            m = dat.read()
        mat = re.findall(r'\* BEGIN material(.*?)\* END', m, re.DOTALL)

        materials = {}
        for m in mat:

            m = MiscFunctions.cleanup(m.split('\n'))
            mat_name = m[0].split()[0]
            materials[mat_name] = {}
            avg_dens = m[0].split()[1]
            materials[mat_name]['density'] = float(avg_dens)
            materials[mat_name]['isotopes'] = {}
            for isoline in m[1:]:
                iso_name = isoline.split()[0]
                iso_dens = float(isoline.split()[1])
                materials[mat_name]['isotopes'][iso_name] = iso_dens
        return materials


class GeometryReader:

    def initialize(self):
        geometries = self.read_geometry()
        return geometries


    @staticmethod
    def read_geometry():

        with open('dat/geometry.txt', 'r') as dat:
            g = dat.read()
        geom = re.findall(r'\* BEGIN geometry(.*?)\* END', g, re.DOTALL)

        geometries = []
        for g in geom:
            geom = MiscFunctions.cleanup(g.split('\n'))
            geometries.append(geom)
        return geometries



class MiscFunctions:

    @staticmethod
    def cleanup(res):
        results = []
        for r in res:
            if not r or r.startswith('#'):
                continue
            results.append(r)
        return results