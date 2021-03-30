"""
    File name: graphs.py
    Author: Guillaume L'HER
    Date created: 3/7/2018
    Date last modified: 3/7/2018
    Python Version: 3.5

    Description: This module generates the graphics.
"""

from matplotlib import pyplot as plt


class Graphs:

    def __init__(self, points, flux):
        self.x = points
        self.y = flux

    def plot(self, filename=''):
        plt.plot(self.x, self.y)
        plt.savefig('outputs/%s.png' % filename)
