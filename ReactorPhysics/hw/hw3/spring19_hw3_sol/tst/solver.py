import numpy as np
from scipy import linalg as linalg

from matplotlib import pyplot as plt

class Solver:

    def __init__(self):
        self.size = 100
        self.deltax = 0.1

        d = np.array([0.02] * (self.size+2))

        siga = np.array([0.02] * (self.size+2))

        self.nu = 2.4


        self.sigf = np.array([0.05] * self.size)

        print(self.sigf.shape)

        self.mat = self.matrix_builder(d, siga)
        print(self.mat.shape)

    def matrix_builder(self, d, siga):
        matrice = []
        for i in range(self.size):
            row = [0] * self.size
            if i == 0:
                row[i] = -(1/ (2 * self.deltax**2)) * (d[i] + 2 * d[i+1] + d[i+2]) - siga[i]
                row[i+1] = (1 / (2 * self.deltax**2)) * (d[i+1] + d[i+2])
            elif i == self.size - 1:
                row[i-1] = (1 / (2 * self.deltax**2)) * (d[i] + d[i+1])
                row[i] = -(1/ (2 * self.deltax**2)) * (d[i] + 2 * d[i+1] + d[i+2]) - siga[i]
            else:
                row[i-1] = (1 / (2 * self.deltax**2)) * (d[i] + d[i+1])
                row[i] = -(1/ (2 * self.deltax**2)) * (d[i] + 2 * d[i+1] + d[i+2]) - siga[i]
                row[i + 1] = (1 / (2 * self.deltax ** 2)) * (d[i + 1] + d[i + 2])
            matrice.append(row)

        return np.array(matrice)

    def eigenvalue_solver(self):

        idsigf = np.identity(self.size) * self.sigf * self.nu

        w, v = linalg.eig(self.mat, b=idsigf)

        plt.plot(list(range(self.size)), [abs(i) for i in v[:,0]])
        plt.plot(list(range(self.size)), [abs(i) for i in v[:,1]])
        plt.plot(list(range(self.size)), [abs(i) for i in v[:,2]])
        plt.show()



if __name__ == '__main__':
    solver = Solver()
    solver.eigenvalue_solver()