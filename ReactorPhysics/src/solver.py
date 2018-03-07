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
        x = np.linalg.solve(mat, rhs)
        if not np.allclose(np.dot(mat, x), rhs):
            print('Damn')
        return x

    def buildmatrix(self, diffusion_coefficients):

        a = []
        #
        # A = np.array([[-(d0+2*d1+d2), d1+d2, 0., 0.],
        #               [d1+d2, -(d1+2*d2+d3), d2+d3, 0.],
        #               [0., d2+d3, -(d2+2*d3+d4), d3+d4],
        #               [0., 0., d3+d4, -(d3+2*d4+d5)]])

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
