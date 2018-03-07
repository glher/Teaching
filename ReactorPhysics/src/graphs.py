import os
from matplotlib import pyplot as plt
from src.geometry import Geometry
from cst import paths_manager as paths


class Graphs:

    def __init__(self, flux):
        geometry = Geometry()
        self.x = geometry.points
        self.y = flux

    def plot(self):
        plt.plot(self.x, self.y)
        plt.savefig(os.path.join(paths.res, 'flux.png'))
