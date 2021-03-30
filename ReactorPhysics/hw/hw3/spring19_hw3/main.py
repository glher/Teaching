"""
    File name: main.py
    Author: Guillaume L'HER
    Date created: 2/3/2019
    Date created: 2/4/2019
    Python Version: 3.5

    Description: This module is the main script. It launches the various specific modules.
"""

# This block uploads the various modules from your project
from src.geometry_reader import GeometryReader
from src.material_reader import MaterialReader
from src.solver_reader import SolverReader
from src.neutronic_solver import NeutronicSolver
from src.graphs import Graphs
import simulation_inputs.parameters as parameters


if parameters.verbose > 0:
    print('==================\n  Initialization  \n==================')

# Launch the initialize function from the MaterialReader class in src/deck_reader.
# This function reads the input deck and obtain a dictionary "material" containing various information on the materials
# in your geometry.
if parameters.verbose > 0:
    print('Setting up the materials...')

material_setup = MaterialReader()
material = material_setup.initialize()

if parameters.verbose > 0:
    print('    ... OK')


# Launch the initialize function from the GeometryReader class in src/deck_reader.
# This function reads the input deck and compute the geometry region (1D geometry), in "geometry".
if parameters.verbose > 0:
    print('Setting up the geometry...')

geometry_setup = GeometryReader()
geometry = geometry_setup.initialize()

if parameters.verbose > 0:
    print('    ... OK')


if parameters.verbose > 0:
    print('Setting up the solver precision...')

#This function set up the nodes in your system, their location and the material associated with them.
solver_setup = SolverReader(geometry)
solver_points_location, solver_points_material = solver_setup.initialize()

# It then assigns the corresponding diffusion coefficient to each solver point (1D geometry),
#  in "diffusion_coefficients". It does the same thing for the cross-sections. Note that in our case, we don't need the
#  scattering cross-section anymore for our solver (it's in the diffusion coefficients).
diffusion_coefficients = []
absorption_xs = []
fission_xs = []
for region in solver_points_material:
    diffusion_coefficients.append(material[region]['diffusion_coefficient'])
    absorption_xs.append(material[region]['macrosig']['abs'])
    fission_xs.append(material[region]['macrosig']['fis'])

if parameters.verbose > 0:
    print('    ... OK')

# At this point, we know what our diffusion coefficient and cross-sections are for every point in our solver.

# Eigenvalue solution for the flux considering your initial materials and your 1D solver geometry precision.
if parameters.verbose > 0:
    print('Solving the diffusion equation...')

neutronic_solver = NeutronicSolver(geometry)
flux = neutronic_solver.run(diffusion_coefficients, absorption_xs, fission_xs)

if parameters.verbose > 0:
    print('    ... OK')


# Note that this flux needs to be scaled up and down depending on the power in your reactor. Additionally, the zero
# boundary fluxes (at node 0 and node N) need to be added.
???


# This takes your initial flux and graph it out using your 1D solver geometry.
if parameters.verbose > 0:
    print('Plotting the flux...')

graphs = Graphs(solver_points_location, flux)
# This saves the output plot in "outputs/flux_0.png"
graphs.plot(filename='flux_0')

if parameters.verbose > 0:
    print('    ... OK')