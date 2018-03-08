"""
    File name: solver.py
    Author: Guillaume L'HER
    Date created: 3/7/2018
    Date last modified: 3/7/2018
    Python Version: 3.5

    Description: This module is the solver. It sets up the linear equations system and solves it using different
    solver (Jacobi, Gauss-Seidel, TriDiag).
"""

import numpy as np
import sys
from cst import parameters


class Solver:

    def __init__(self):
        self.iterations_number = parameters.iterations_limit
        self.size = int(parameters.length / parameters.deltax) - 1
        self.phi0 = parameters.phi0
        self.verbose = parameters.verbose

    def run(self, diffusion_coefficients):
        """
        This function sets up the right hand side of the matrix equation and call the different solver based on a
        user-defined parameter. It then generates the error.
        :param diffusion_coefficients: vector of the diffusion coefficients given the geometry
        :return: flux for each point
        """
        mat = self.buildmatrix(diffusion_coefficients)

        rhs = np.zeros(self.size)
        rhs[0] = -(diffusion_coefficients[0] + diffusion_coefficients[1]) * self.phi0

        if self.verbose > 0:
            print("System of equations:")
        for i in range(mat.shape[0]):
            row = ["{0:3g}*x{1}".format(mat[i, j], j + 1) for j in range(mat.shape[1])]
            if self.verbose > 0:
                print("[{0}] = [{1:3g}]".format(" + ".join(row), rhs[i]))

        if parameters.solver == 'jacobi':
            x = self.jacobi_solver(mat, rhs)
        elif parameters.solver == 'gauss-seidel':
            x = self.gauss_seidel_solver(mat, rhs)
        elif parameters.solver == 'tridiag':
            x = self.tridiag_solver(mat, rhs)
        else:
            sys.exit('Unknown solver')

        if self.verbose > 1:
            print("Solution: {0}".format(x))
        error = np.dot(mat, x) - rhs
        if self.verbose > 1:
            print("Error: {0}".format(error))
        x = np.insert(x, 0, self.phi0)
        x = np.append(x, 0)
        return x

    def gauss_seidel_solver(self, mat, rhs):
        """
        The Gauss-Seidel is a variant of the Jacobi solver. It does the same but updates the values of determined
        results within the same iteration.
        :param mat: matrice of coefficients
        :param rhs: right hand side of the equation
        :return: flux vector
        """
        x = np.zeros_like(rhs)
        for it_count in range(1, self.iterations_number):
            x_new = np.zeros_like(x)
            if self.verbose > 1:
                print("Iteration {0}: {1}".format(it_count, x))
            for i in range(mat.shape[0]):
                s1 = np.dot(mat[i, :i], x_new[:i])
                s2 = np.dot(mat[i, i + 1:], x[i + 1:])
                x_new[i] = (rhs[i] - s1 - s2) / mat[i, i]
            if np.allclose(x, x_new, rtol=1e-8):
                break
            x = x_new
        return x

    def jacobi_solver(self, mat, rhs):
        """
        The Jacobi method solves the first equation for x1, the second for x2, etc. It then starts from an initial
        guess for each value. Compute the result: this is the first iteration. Repeat and converge.
        :param mat: matrice of coefficients
        :param rhs: right hand side of the equation
        :return: flux vector
        """
        x = np.zeros_like(rhs)
        for it_count in range(self.iterations_number):
            x_new = np.zeros_like(x)
            if self.verbose > 1:
                print("Iteration {0}: {1}".format(it_count, x))
            for i in range(mat.shape[0]):
                s1 = np.dot(mat[i, :i], x[:i])
                s2 = np.dot(mat[i, i + 1:], x[i + 1:])
                x_new[i] = (rhs[i] - s1 - s2) / mat[i, i]
            if np.allclose(x, x_new, rtol=1e-8):
                break
            x = x_new
        return x

    def tridiag_solver(self, mat, rhs):
        """
        Solve a linear matrix equation, or system of linear scalar equations.
        Computes the “exact” solution, x, of the well-determined, i.e., full rank, linear matrix equation ax = b.
        :param mat:
        :param rhs:
        :return: flux vector
        """
        x = np.linalg.solve(mat, rhs)
        if not np.allclose(np.dot(mat, x), rhs):
            print('Damn')
        return x

    def buildmatrix(self, diffusion_coefficients):
        """
        Builds the matrix of coefficients for an arbitrary sized system
        :param diffusion_coefficients: list of dissufion coefficients per node
        :return: matrix of coefficients
        """
        a = []

        for i in range(self.size):
            line = np.zeros(self.size)
            if i == 0:
                line[i] = -(diffusion_coefficients[i] + 2*diffusion_coefficients[i+1] + diffusion_coefficients[i+2])
                line[i+1] = diffusion_coefficients[i+1] + diffusion_coefficients[i+2]
            elif i == self.size-1:
                line[i - 1] = diffusion_coefficients[i] + diffusion_coefficients[i+1]
                line[i] = -(diffusion_coefficients[i] + 2*diffusion_coefficients[i+1] + diffusion_coefficients[i+2])
            else:
                line[i-1] = diffusion_coefficients[i] + diffusion_coefficients[i+1]
                line[i] = -(diffusion_coefficients[i] + 2*diffusion_coefficients[i+1] + diffusion_coefficients[i+2])
                line[i+1] = diffusion_coefficients[i+1] + diffusion_coefficients[i+2]
            a.append(line)
        a = np.asarray(a)

        return a
