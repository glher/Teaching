"""
    File name: run.py
    Author: Guillaume L'HER
    Date created: 3/7/2018
    Date last modified: 3/7/2018
    Python Version: 3.5

    Description: This module is the main script. It launches the various specific modules.
"""

# from src.geometry import Geometry

from src.deck_reader import MaterialSolver, GeometrySolver

from python.src.solver import NeutronicSolver
from python.src.graphs import Graphs

geometry = GeometrySolver().initialize()
material = MaterialSolver().initialize()

print(material)

import sys;sys.exit()




# geometry = Geometry()
# diffusion_coefficients = geometry.run()
isotopic_vector = material_solver.initialize()
diffusion_coefficient = geometry.run(isotopic_vector)

for bu in burnup_steps:
    neutronic_solver = NeutronicSolver()
    flux = neutronic_solver.run(diffusion_coefficients)

    bateman_solver = MaterialSolver()
    isotopic_vector = material_solver.update(isotopic_vector, flux)

graphs = Graphs(flux)
graphs.plot()
