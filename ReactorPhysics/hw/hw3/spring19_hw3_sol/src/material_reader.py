# Import the generic package you will need
import re
# Import your own necessary modules, in this case the constants and parameters files.
from src.tools import MiscFunctions


class MaterialReader:
    """
    This class will read the materials input deck (physical_inputs/materials.txt) and compute several information on the
    materials given by the user.
    The user will give each material using the following template:

* BEGIN material
mat1 15.1
92235 0.36
92238 49.64
8016 5.595
1001 44.405
* END

    - The first line must always be "* BEGIN material". This tells the code that you are defining a new material.
    - The second line gives the name, "mat1" here and the density of your material in g/cm3.
    - The third to sixth lines give the ZAIDS (unique identification number per isotope) and their relative weight
    percentage in the material.
    - The last line must always be "* END" in order to tell the code that you are done defining the material.

    As an example, take a material "water" which is H2O at a 0.78 g/cm3 density. In this case, you will have:

* BEGIN material
water 0.78
1001 11.19
8016 88.81
* END

    ZAIDS: Each identifier is made up of the number of protons (atomic number), and followed by the mass number
    (number of protons and neutrons). For example, U235 has 92 neutrons and 143 neutrons. Its atomic number is 92
     and its mass number is 235. It will thus be defined as 92235.
        Note that this implies that some metastable state of the same isotope can be tricky to define,
        particularly Am242 and its isomer Am242m. They both have the same atomic and mass numbers, but their
        cross-sections are different.

    """

    def __init__(self):

        # Read the microscopic cross-section from your nuclear_data/cross_sections.txt file
        self.cross_sections = self.read_xs()
        # Read the mass numbers from your nuclear_data/mass_numbers.txt file
        self.mass_number = self.read_mass_number()
        # Read the atomic mass from your nuclear_data/atomic_masses.txt file
        self.atomic_mass = self.read_atomic_mass()


    def initialize(self):
        """
        This function is the initialization of your system. It is not calculating the materials, such as a Bateman
        solver would, but is reading the initial compositions from your input deck.
        :return: materials: A dictionary containing a bunch of information relative to each of your materials, such as
        the cross-sections, the isotopes, the diffusion coefficient.
        """

        # Read the material from your file and initialize your "materials" dictionary
        materials = self.read_material()

        # Compute the macroscopic cross-section using:
        #    - the total density
        #    - the weight percentage of each isotopes
        #    - The microscopic cross-section of each isotopes (scattering and absorption)
        # It then updates the "materials" dictionary with that information
        materials = self.get_macroxs(materials)

        # Compute the diffusion coefficient of a given material using the macroscopic cross-section and the average
        # cosine of the scattering angle. It then updates the "materials" dictionary with that information.
        materials = self.get_diffusion_coefficient(materials)

        # I recommend you look at what's in the "materials" variable at this point:
        # print(materials)
        return materials


    def get_diffusion_coefficient(self, materials):
        """
        This function computes the diffusion coefficient for each given materials. In order to do so, it calculates the
        average cosine of the scattering angle "mu0", and applies the formula:
        D = 1 / (3 * (macroscopic_sigma_absorption + macroscopic_sigma_scattering * (1 - mu0)))

        :param materials: dictionary containing the necessary information such as the macroscopic cross-sections.
        :return: materials: updated dictionary with the diffusion coefficient added for each material
        """
        # For each material defined by the user
        for m in materials:
            # Fetch the value of mu0
            mu0 = self.get_avg_cosine(materials[m])
            # Calculate the diffusion coefficient D
            materials[m]['diffusion_coefficient'] = 1 / (3 * (materials[m]['macrosig']['abs']
                                                              + materials[m]['macrosig']['sca'] * (1 - mu0)))
        return materials

    def get_avg_cosine(self, materials):
        """
        This function computes the average cosine of the scattering angle in the lab system, with is equal to:
        mu0 = 2/(3A), where A is the average mass number of your material.

        :param materials: dictionary containing the necessary information such as the macroscopic cross-sections.
        :return: mu0: average cosine of the scattering angle
        """
        # Initialize your average mass number
        avg_mass_number = 0
        for isotope in materials['isotopes']:
            # Ass in the mass weighted percentage of mass number for each isotope.
            # Careful, this multiplies by weight percent, not atomic percent!
            avg_mass_number += self.atomic_mass[isotope] * materials['isotopes'][isotope]
        return 2 / (3 * avg_mass_number)

    def get_macroxs(self, materials):
        """
        This function computes the macroscopic cross-section from the microscopic cross-sections (contained in the
        "cross_sections" variable and the number density. The number density is computed using the total material
        density and each isotope weight fraction.

        N_isotopeX = total_density_of_material * weight_percent_of_isotopeX * Avogadro_number / atomic_mass_isotopeX
        macroscopic_cross_section_reaction = SUM(for all isotopeXs) of N_isotopeX * microscopic_cross_section_reaction

        :param materials: dictionary containing the necessary information such as the macroscopic cross-sections.
        :param cross_sections: dictionary containing the microscopic cross-sections.
        :return: materials: updated dictionary with the macroscopic cross-sections added for each material
        """
        # For each material defined by the user
        for m in materials:
            # Fetch the total density
            rho_glob = materials[m]['density']
            # Get the avogadro constant
            avogadro = 6.022e23
            # Initialize the cross-sections
            macrosig_a = 0
            macrosig_s = 0
            macrosig_f = 0
            # For each isotopes in the material
            for isotope in materials[m]['isotopes']:
                # Compute the number density
                n_iso = rho_glob * materials[m]['isotopes'][isotope] * avogadro / self.atomic_mass[isotope]
                # Add in the isotope participation to the macroscopic cross-section
                macrosig_a += n_iso * self.cross_sections[isotope]['abs']
                macrosig_s += n_iso * self.cross_sections[isotope]['sca']
                macrosig_f += n_iso * self.cross_sections[isotope]['fis']
            # Update the "materials" dictionary with the information
            materials[m]['macrosig'] = {'abs': macrosig_a, 'sca': macrosig_s, 'fis': macrosig_f}
        return materials


    @staticmethod
    def read_atomic_mass():
        """
        This function reads the mass number from the dat/atomic_masses.txt file given.
        If a line starts with a '#', this is a comment and the code ignores the line.
        :return: atomicmass: dictionary containing the mass number for each isotope in the database
        """
        # Initialize the dictionary
        atomicmass = {}
        # Open the nuclear_data/atomic_masses.txt file for reading
        with open('nuclear_data/atomic_masses.txt', 'r') as dat:
            # For each line in the file
            for aline in dat.readlines():
                # If it starts with a '#', go to the next line right away
                if aline.startswith('#'):
                    continue
                # This code is only reached if we didn't have a '#' character at the start of the line
                # Split the line into a list using ';' as a separator. So, "a;b;c" becomes [a, b, c] for the code
                aline = aline.split(';')
                print(aline)
                # Update the dictionary using the first item on the line as key. If you go to the txt file, you
                # will see that this is the ZAID number.
                atomicmass[aline[0]] = float(aline[1].rstrip())

        return atomicmass


    @staticmethod
    def read_mass_number():
        """
        This function reads the mass number from the dat/mass_numbers.txt file given.
        If a line starts with a '#', this is a comment and the code ignores the line.
        :return: massnumber: dictionary containing the mass number for each isotope in the database
        """
        # Initialize the dictionary
        massnumber = {}
        # Open the nuclear_data/mass_numbers.txt file for reading
        with open('nuclear_data/mass_numbers.txt', 'r') as dat:
            # For each line in the file
            for mline in dat.readlines():
                # If it starts with a '#', go to the next line right away
                if mline.startswith('#'):
                    continue
                # This code is only reached if we didn't have a '#' character at the start of the line
                # Split the line into a list using ';' as a separator. So, "a;b;c" becomes [a, b, c] for the code
                mline = mline.split(';')
                # Update the dictionary using the first item on the line as key. If you go to the txt file, you
                # will see that this is the ZAID number.
                massnumber[mline[0]] = float(mline[1].rstrip())

        return massnumber


    @staticmethod
    def read_xs():
        """
        This function reads the microscopic cross-section from the nuclear_data/cross_sections.txt file given.
        In that data file, the cross-sections are given in barns for simplicity, hence the multiplication by 1e-24
        to come back to SI units.
        If a line starts with a '#', this is a comment and the code ignores the line.
        :return: xs: dictionary containing the microscopic cross-sections for each isotope in the database
        """
        # Initialize the dictionary
        xs = {}
        # Open the dat/xs.txt file for reading
        with open('nuclear_data/cross_sections.txt', 'r') as dat:
            # For each line in the file
            for xsline in dat.readlines():
                # If it starts with a '#', go to the next line right away
                if xsline.startswith('#'):
                    continue
                # This code is only reached if we didn't have a '#' character at the start of the line
                # Split the line into a list using ';' as a separator. So, "a;b;c" becomes [a, b, c] for the code
                xsline = xsline.split(';')
                # Update the dictionary using the first item on the line as key. If you go to the txt file, you
                # will see that this is the ZAID number. Then, you can see that the file must follow a very strict order
                # when defining its columns. It goes zaid;absorption;scattering;fission.
                xs[xsline[0]] = {'abs': float(xsline[1]) * 1e-24,
                                 'sca': float(xsline[2]) * 1e-24,
                                 'fis': float(xsline[3]) * 1e-24}

        return xs


    @staticmethod
    def read_material():
        """
        This function reads the materials information from the input deck by using the delimiters "* BEGIN material" and
        "* END".
        It then parses the text in between to create the "materials" dictionary.

        :return: materials: new dictionary with the materials basic information (density, compositions)
        """

        # Open the dat/deck.txt for reading
        with open('physical_inputs/materials.txt', 'r') as dat:
            # This reads all the lines into one string, so that we can do some treatment on it
            m = dat.read()
        # The regex module (re) finds the text between the delimiters and puts it into "mat".
        mat = re.findall(r'\* BEGIN material(.*?)\* END', m, re.DOTALL)

        # Initialize the materials
        materials = {}
        # For each material defined in the deck
        for m in mat:
            # Cleanup the results (by removing empty line or commented lines)
            m = MiscFunctions.cleanup(m.split('\n'))
            # Read the material name
            mat_name = m[0].split()[0]
            # Create the material name entry for the dictionary
            materials[mat_name] = {}
            # Read the total density
            avg_dens = m[0].split()[1]
            # Create the material name --> density entry in the dictionary
            materials[mat_name]['density'] = float(avg_dens)
            # Create the material name --> isotopes entry in the dictionary
            materials[mat_name]['isotopes'] = {}
            # For each isotope in the deck
            for isoline in m[1:]:
                # Get the zaid
                iso_name = isoline.split()[0]
                # Get the weight fraction
                iso_dens = float(isoline.split()[1])
                # Update the material name ==> isotopes entry in the dictionary
                materials[mat_name]['isotopes'][iso_name] = iso_dens
        return materials