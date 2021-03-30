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
from src.burnup_reader import BurnupReader
from src.solver_reader import SolverReader
from src.neutronic_solver import NeutronicSolver
from src.graphs import Graphs
from simulation_inputs import parameters


if parameters.verbose > 0:
    print('==================\n  Initialization  \n==================')

# Launch the initialize function from the MaterialReader class in src/deck_reader.
# This function reads the input deck and obtain a dictionary "material" containing various information on the materials
# in your geometry.
if parameters.verbose > 0:
    print('Setting up the materials...')

material_setup = MaterialReader()
material = material_setup.initialize()
print(material)

if parameters.verbose > 0:
    print('    ... OK')


# Launch the initialize function from the GeometryReader class in src/deck_reader.
# This function reads the inout deck and compute the geometry region (1D geometry), in "geometry". It also returns the
# material at each 1D coordinates for the points in your solver, in "points".
if parameters.verbose > 0:
    print('Setting up the geometry...')

geometry_setup = GeometryReader()
geometry = geometry_setup.initialize()

print(geometry)

if parameters.verbose > 0:
    print('    ... OK')


if parameters.verbose > 0:
    print('Setting up the solver precision...')

solver_setup = SolverReader(geometry)
solver_points_location, solver_points_material = solver_setup.initialize()

# It then assigns the corresponding diffusion coefficient to each solver point (1D geometry),
#  in "diffusion_coefficients".
diffusion_coefficients = []
absorption_xs = []
fission_xs = []
for region in solver_points_material:
    diffusion_coefficients.append(material[region]['diffusion_coefficient'])
    absorption_xs.append(material[region]['macrosig']['abs'])
    fission_xs.append(material[region]['macrosig']['fis'])

if parameters.verbose > 0:
    print('    ... OK')

# At this point, we know what our diffusion coefficient is for every point in our solver ("diffusion_coefficient"),
# as well as the corresponding data (isotopic vector, cross-sections) for each material ("points" and "material")

# Initial solve for the flux considering your initial materials and your 1D solver geometry precision.
# Note: The solver is d2/dx2(D * phi) = 0, no absorption considered, but the diffusion coefficient does take into
# account the absorption cross-section.
if parameters.verbose > 0:
    print('Solving the diffusion equation...')

neutronic_solver = NeutronicSolver(geometry)
flux = neutronic_solver.run(diffusion_coefficients, absorption_xs, fission_xs)

if parameters.verbose > 0:
    print('    ... OK')

# This takes your initial flux and graph it out using your 1D solver geometry.
if parameters.verbose > 0:
    print('Plotting the flux...')

print(solver_points_location.shape[1:-1])
print(len(flux))
graphs = Graphs(solver_points_location[1:-1], flux)
graphs.plot(filename='flux_0')

if parameters.verbose > 0:
    print('    ... OK')

# Now, when we burn our material for some time, or burnup (MW.day / kg heavy metal), this changes our material
# composition as the isotopes in there interact with the neutron field and absorb neutrons to fission, decay, etc.
# We give the code a list of burnup step we want to go through, and we loop through them, updating our material and thus
# our flux at every step.

if parameters.verbose > 0:
    print('Setting up the burnup steps...')

burnup_setup = BurnupReader()
burnup = burnup_setup.initialize()

if parameters.verbose > 0:
    print('    ... OK')

# Start a burnup null.
bu = 0

for bu_step in burnup['steps']:

    # Keep track of where we are in the total burnup
    bu += bu_step

    if parameters.verbose > 0:
        print('===================\nBurnup: %s MWd/kg\n===================' % bu)

    # Send the previous material information into the BatemanSolver, update it to get the new macroscopic cross-sections
    # and the new diffusion coefficients by sending it back to MaterialReader basic functions

    # The call to BatemanSolver is commented out since the module does not exist yet. Instead, we just relaunch the
    # initialization, in effect saying that our material does not change with the burnup (incorrect, but that's a
    # placeholder until the Bateman solver is in place).
    # The Bateman equations will calculate the change in the material given:
    # - an initial fuel composition at each point in the solver,
    # - the corresponding flux during the burnup step considered, and
    # - The power your reactor is running at.
    # Of course, the change in material is dependent on burnup and consequently, the higher your step size, the less
    # precise your material update.

    if parameters.verbose > 0:
        print('Updating the materials... [Placeholder]')

    # material = BatemanSolver().run(material, bu_step, burnup['power'])
    material_setup = MaterialReader()
    material = material_setup.initialize()

    # Update the diffusion coefficients according to the new material information computed
    diffusion_coefficients = []
    for region in solver_points_material:
        diffusion_coefficients.append(material[region]['diffusion_coefficient'])

    if parameters.verbose > 0:
        print('    ... OK')

    if parameters.verbose > 0:
        print('Solving the diffusion equation... [Algorithm: %s]' % parameters.solver)

    # Recalculate the flux using the updated diffusion_coefficients for each point in your solver
    neutronic_solver = NeutronicSolver(geometry)
    flux = neutronic_solver.run(diffusion_coefficients)

    if parameters.verbose > 0:
        print('    ... OK')

    # Graph the updated flux at the current burnup
    if parameters.verbose > 0:
        print('Plotting the flux...')

    graphs = Graphs(solver_points_location, flux)
    graphs.plot(filename='flux_%s' % bu)

    if parameters.verbose > 0:
        print('    ... OK')