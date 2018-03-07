import numpy as np
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
        rhs[0] = -diffusion_coefficients[1] * self.phi0

        if self.verbose > 0:
            print("System of equations:")
        for i in range(mat.shape[0]):
            row = ["{0:3g}*x{1}".format(mat[i, j], j + 1) for j in range(mat.shape[1])]
            if self.verbose > 0:
                print("[{0}] = [{1:3g}]".format(" + ".join(row), rhs[i]))

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

        if self.verbose > 1:
            print("Solution: {0}".format(x))
        error = np.dot(mat, x) - rhs
        if self.verbose > 1:
            print("Error: {0}".format(error))
        x = np.insert(x, 0, self.phi0)
        x = np.append(x, 0)
        return x

    def buildmatrix(self, diffusion_coefficients):

        a = []
        for i in range(self.size):
            line = np.zeros(self.size)
            if i == 0:
                line[i] = -(diffusion_coefficients[i+1] + diffusion_coefficients[i+2])
                line[i+1] = diffusion_coefficients[i+2]
            elif i == self.size-1:
                line[i - 1] = diffusion_coefficients[i + 1]
                line[i] = -(diffusion_coefficients[i + 1] + diffusion_coefficients[i + 2])
            else:
                line[i-1] = diffusion_coefficients[i+1]
                line[i] = -(diffusion_coefficients[i+1] + diffusion_coefficients[i+2])
                line[i+1] = diffusion_coefficients[i+2]
            a.append(line)
        a = np.asarray(a)

        return a
