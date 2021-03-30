import numpy as np
from scipy import linalg as linalg

from matplotlib import pyplot as plt


class Test:

    def __init__(self):
        self.size = 100
        self.deltax = 0.1

        d = np.array([0.02] * (self.size+1))

        # siga = np.array([0.002] * (self.size+1))
        siga = np.array([0.] * (self.size+1))

        self.nu = 2.4

        self.sig_f = np.array([0.005] * self.size)
        # self.sig_f = np.array([0.] * self.size)

        self.mat = self.matrix_builder(d, siga)

    def matrix_builder(self, d, siga):
        matrice = []
        for i in range(self.size):
            row = [0] * self.size
            if i == 0:
                row[i] = -(1 / (2 * self.deltax ** 2)) * (d[i-1] + 2 * d[i] + d[i+1]) - siga[i]
                row[i+1] = (1 / (2 * self.deltax ** 2)) * (d[i] + d[i+1])
            elif i == self.size-1:
                row[i-1] = (1 / (2 * self.deltax ** 2)) * (d[i-1] + d[i])
                row[i] = -(1 / (2 * self.deltax ** 2)) * (d[i-1] + 2 * d[i] + d[i+1]) - siga[i]
            else:
                row[i-1] = (1 / (2 * self.deltax ** 2)) * (d[i-1] + d[i])
                row[i] = -(1 / (2 * self.deltax ** 2)) * (d[i-1] + 2 * d[i] + d[i+1]) - siga[i]
                row[i+1] = (1 / (2 * self.deltax ** 2)) * (d[i] + d[i+1])

            matrice.append(row)

        return np.array(matrice)

    def eigenvalue(self):

        idsigf = np.identity(self.size) * self.sig_f * self.nu
        w, v = linalg.eig(self.mat, b=idsigf)

        plt.plot(list(range(self.size)), [abs(i) for i in v[:,0]])
        print(1/w[0])
        # plt.plot(list(range(self.size)), [abs(i) for i in v[:,1]])
        # plt.plot(list(range(self.size)), [abs(i) for i in v[:,2]])
        plt.show()

if __name__ == '__main__':
    test = Test()
    test.eigenvalue()