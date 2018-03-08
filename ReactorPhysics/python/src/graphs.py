"""
    File name: graphs.py
    Author: Guillaume L'HER
    Date created: 3/7/2018
    Date last modified: 3/7/2018
    Python Version: 3.5

    Description: This module generates the graphics.
"""

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
