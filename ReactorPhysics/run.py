"""
    File name: run.py
    Author: Guillaume L'HER
    Date created: 3/7/2018
    Date last modified: 3/7/2018
    Python Version: 3.5

    Description: This module is the main script. It launches the various specific modules.
"""

from src.geometry import Geometry
from src.solver import Solver
from src.graphs import Graphs

geometry = Geometry()
diffusion_coefficients = geometry.run()

solver = Solver()
flux = solver.run(diffusion_coefficients)

graphs = Graphs(flux)
graphs.plot()
