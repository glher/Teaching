# -*- coding: utf-8 -*-
"""
    File name: neutronic_solver.py
    Author: Guillaume L'HER
    Date created: 3/7/2018
    Date last modified: 3/7/2018
    Python Version: 3.5

    Description: This module is the solver. It sets up the linear equations system and solves it.
"""

import numpy as np
import simulation_inputs.parameters as parameters
from scipy import linalg as linalg


class NeutronicSolver:

    def __init__(self, geometry):
        length = geometry['distance'][-1]
        self.size = int(length / parameters.deltax) - 1
        self.verbose = parameters.verbose

    def run(self, diffusion_coefficients, siga, sigf):
        """
        This function sets up the right hand side of the matrix equation and call the different solver based on a
        user-defined parameter. It then generates the error.
        :param diffusion_coefficients: vector of the diffusion coefficients given the geometry
        :param siga: vector of the absorption cross-sections
        :param sigf: vector of the fission cross-sections
        :return: flux for each point
        """

        # Express the lists as numpy arrays (easier to make calculations on)
        diffusion_coefficients = np.array(diffusion_coefficients)
        siga = np.array(siga)
        # Note that we remove the boundary values (first and last index) of sigf to have a correct dimension.
        # We know our flux there so the eigenvalue solver doesn't apply there.
        sigf = np.array(sigf)[1:-1]

        # This matrix dimension is self.size * self.size
        mat = self.buildmatrix(diffusion_coefficients, siga)
        # Here we want the right hand side of the eigenvalue equation, that is the fission term.
        # This matrix dimension must be self.size * self.size
        idsigf = np.identity(self.size) * sigf * parameters.nu

        flux = self.eigenvalue_solver(mat, idsigf)

        return flux

    def buildmatrix(self, diffusion_coefficients, siga):
        """
        Builds the matrix of coefficients for an arbitrary sized system
        :param diffusion_coefficients: list of diffusion coefficients per node
        :return: matrix of coefficients
        """
        a = []

        for i in range(self.size):
            line = np.zeros(self.size)
            if i == 0:
                line[i] = -(1/ (2 * parameters.deltax**2)) * (diffusion_coefficients[i] + 2*diffusion_coefficients[i+1] + diffusion_coefficients[i+2]) - siga[i]
                line[i+1] = (1/ (2 * parameters.deltax**2)) * diffusion_coefficients[i+1] + diffusion_coefficients[i+2]
            elif i == self.size-1:
                line[i-1] = (1/ (2 * parameters.deltax**2)) * diffusion_coefficients[i] + diffusion_coefficients[i+1]
                line[i] = -(1/ (2 * parameters.deltax**2)) * (diffusion_coefficients[i] + 2*diffusion_coefficients[i+1] + diffusion_coefficients[i+2]) - siga[i]
            else:
                line[i-1] = (1/ (2 * parameters.deltax**2)) * diffusion_coefficients[i] + diffusion_coefficients[i+1]
                line[i] = -(1/ (2 * parameters.deltax**2)) * (diffusion_coefficients[i] + 2*diffusion_coefficients[i+1] + diffusion_coefficients[i+2]) - siga[i]
                line[i+1] = (1/ (2 * parameters.deltax**2)) * diffusion_coefficients[i+1] + diffusion_coefficients[i+2]
            a.append(line)
        a = np.asarray(a)

        return a

    def eigenvalue_solver(self, mat, idsigf):

        w, v = linalg.eig(mat, b=idsigf)

        flux = [abs(i) for i in v[:,0]]

        return flux