from matplotlib import pyplot as plt
from geometry import Geometry

class Graphs:

    def __init__(self, flux):
        geometry = Geometry()
        self.x = geometry.points
        self.y = flux

    def plot(self):
        plt.plot(self.x, self.y)
        plt.savefig('flux.png')
