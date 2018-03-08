"""
    File name: geometry.py
    Author: Guillaume L'HER
    Date created: 3/7/2018
    Date last modified: 3/7/2018
    Python Version: 3.5

    Description: This module reads the geometry file - 1D only. It returns the diffusion coefficients for each
    point in the system given a deltaX.
"""

import numpy as np
from bisect import bisect_left
import os
from cst import parameters
from cst import paths_manager as paths


class Geometry:

    def __init__(self):
        self.filename = os.path.join(paths.dat, 'geometry.txt')
        self.length = parameters.length
        self.deltax = parameters.deltax
        self.points = np.linspace(0, self.length, int(self.length/self.deltax)+1)

    def run(self):
        """
        Get the diffusion coefficient for every points for the solver
        :return: list of diffusion coefficients
        """
        distance, diffusion_coefficient = self.get_diff_coeff()
        d_coeff = []
        for i in self.points:
            idx = bisect_left(distance, i)
            d_coeff.append(diffusion_coefficient[idx])
        return d_coeff

    def get_diff_coeff(self):
        """
        Reads the geometry.txt file and compute the corresponding diffusion coefficients from the microscopic cross
        sections and the number densities of atoms.
        :return:
        """
        distance = []
        diffusion_coefficient = []
        with open(self.filename, 'r') as geom:
            lines = geom.readlines()
            for l in lines:
                if l.startswith('#'):
                    continue
                d = l.split(';')[0]
                composition = l.split(';')[1]
                numcomp = composition.split(',')
                macrosig = 0.
                for c in numcomp:
                    macrosig += float(c.split(':')[0]) * float(c.split(':')[1]) * 1e-24
                distance.append(float(d))
                diffusion_coeff = 1. / (3 * macrosig)
                diffusion_coefficient.append(diffusion_coeff)
        return distance, diffusion_coefficient
