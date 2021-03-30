import numpy as np
from scipy import linalg as linalg
from matplotlib import pyplot as plt

# Define system size
size = 6
deltax = 1

# Define constants
d = np.array([0.02] * (size + 2))
siga = np.array([0.02] * size)
nu = 2.4
sigf = np.array([0.05] * size)


# Build the matrix
matrice = []
for i in range(size):
    row = [0] * size
    if i == 0:
        row[i] = - (1/(2*deltax**2)) * (d[i] + 2 * d[i+1] + d[i+2]) - siga[i]
        row[i+1] = (1/(2* deltax**2)) * (d[i+1] + d[i+2])
    elif i == size - 1:
        row[i-1] = (1/(2*deltax**2)) * (d[i] + d[i+1])
        row[i] = -(1/(2*deltax**2)) * (d[i] + 2 * d[i+1] + d[i+2]) - siga[i]
    else:
        row[i - 1] = (1 / (2 * deltax ** 2)) * (d[i] + d[i + 1])
        row[i] = -(1 / (2 * deltax ** 2)) * (d[i] + 2 * d[i + 1] + d[i + 2]) - siga[i]
        row[i + 1] = (1 / (2 * deltax ** 2)) * (d[i + 1] + d[i + 2])
    matrice.append(row)

matrice = np.array(matrice)

# Define our solver
idsigf = np.identity(size) * sigf * nu

w, v = linalg.eig(matrice, b=idsigf)

plt.plot(list(range(size)), [i for i in v[:,0]])
plt.show()

plt.plot(list(range(size)), [i for i in v[:,0]])
plt.plot(list(range(size)), [i for i in v[:,1]])
plt.show()

plt.plot(list(range(size)), [i for i in v[:,0]])
plt.plot(list(range(size)), [i for i in v[:,1]])
plt.plot(list(range(size)), [i for i in v[:,2]])
plt.show()

plt.plot(list(range(size)), [i for i in v[:,0]])
plt.plot(list(range(size)), [i for i in v[:,1]])
plt.plot(list(range(size)), [i for i in v[:,2]])
plt.plot(list(range(size)), [i for i in v[:,3]])
plt.plot(list(range(size)), [i for i in v[:,4]])
plt.plot(list(range(size)), [i for i in v[:,5]])
plt.show()

plt.plot(list(range(size)), [i for i in v[:,0]])
plt.show()