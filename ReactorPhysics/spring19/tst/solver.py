import numpy as np
from scipy import linalg as linalg

from matplotlib import pyplot as plt

class Solver:

    def __init__(self):
        # Define the size of the system [matrix system] (geometry and precision)
        self.size = 100
        self.deltax = 0.1

        # Define the materials in the system (diffusion coefficient, cross-sections, nu)
        # Note the size + 2 to account for boundaries for diffusion coefficient
        d = np.array([0.02] * (self.size+2))
        siga = np.array([0.02] * self.size)
        self.nu = 2.4
        self.sigf = np.array([0.05] * self.size)

        self.mat = self.matrix_builder(d, siga)

    def matrix_builder(self, d, siga):
        matrice = []
        for i in range(self.size):
            row = [0] * self.size
            if i == 0:
                row[i] = (1 / (2 * self.deltax**2)) * (2 * d[i]) - \
                         (1/ (2 * self.deltax**2)) * (d[i] + 2 * d[i+1] + d[i+2]) - siga[i]
                row[i+1] = (1 / (2 * self.deltax**2)) * (d[i+1] + d[i+2])
            elif i == self.size - 1:
                row[i-1] = (1 / (2 * self.deltax**2)) * (d[i] + d[i+1])
                row[i] = -(1/ (2 * self.deltax**2)) * (d[i] + 2 * d[i+1] + d[i+2]) - siga[i]
            else:
                row[i-1] = (1 / (2 * self.deltax**2)) * (d[i] + d[i+1])
                row[i] = -(1/ (2 * self.deltax**2)) * (d[i] + 2 * d[i+1] + d[i+2]) - siga[i]
                row[i+1] = (1 / (2 * self.deltax ** 2)) * (d[i + 1] + d[i + 2])
            matrice.append(row)

        return np.array(matrice)

    def eigenvalue_solver(self):

        idsigf = np.identity(self.size) * self.sigf * self.nu

        w, v = linalg.eig(self.mat, b=idsigf)

        plt.plot(list(range(self.size)), [i for i in v[:,0]])
        plt.show()

        plt.plot(list(range(self.size)), [i for i in v[:,0]])
        plt.plot(list(range(self.size)), [i for i in v[:,1]])
        plt.show()

        plt.plot(list(range(self.size)), [i for i in v[:,0]])
        plt.plot(list(range(self.size)), [i for i in v[:,1]])
        plt.plot(list(range(self.size)), [i for i in v[:,2]])
        plt.show()

        plt.plot(list(range(self.size)), [i for i in v[:,0]])
        plt.plot(list(range(self.size)), [i for i in v[:,1]])
        plt.plot(list(range(self.size)), [i for i in v[:,2]])
        plt.plot(list(range(self.size)), [i for i in v[:,3]])
        plt.plot(list(range(self.size)), [i for i in v[:,4]])
        plt.plot(list(range(self.size)), [i for i in v[:,5]])
        plt.show()

        plt.plot(list(range(self.size)), [i for i in v[:,0]])
        plt.show()



if __name__ == '__main__':
    solver = Solver()
    solver.eigenvalue_solver()