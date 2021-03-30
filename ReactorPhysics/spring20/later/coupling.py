# Define the geometry --> This comes from the eigenvalue solver
system_size = None
deltax = None

# Define the initial material --> This comes from the burnup solver (recall, in teh eigenvalue solver, it was inferred)
N = None  # number densities  --> N = [n1, n2, n3, n4, n5]
xs = None  # microscopic cross section
lambd = None  # lambda --> library

# Define time steps and period --> This comes from the burnup solver
delta_t = None
simulation_time = None
time_steps = None

# Now, we have our initial parameters --> We need to start the time loop
evolution_flux = []
evolution_comp = []
for t in time_steps:
    # Calculate the flux:
    # Get material properties (diffusion coefficient, macroscopic cross sections)
    diffusion_coefficient = None
    macroscopic_cross_sections = None
    # Using what you've done in the eigenvalue solver: Build the matrix
    matrix_diffusion_equation = None
    right_hand_side = None
    # Solve the eigenvalue problem to get the flux
    w, v = linalg.eig(matrix_diffusion_equation, b=right_hand_side)
    # Scale the flux relative to a given power, 1 MW/m3
    flux = None  # flux = [f1, f2, f3, f4, f5]
    # Your flux is not homogeneous, it varies depending on which node you are on, where in your system you're looking

    # Calculate the burnup:
    # Build the reaction rate matrix --> This comes from the burnup solver (compute_reaction_rate_matrix function)
    rrm = None
    for i, node in enumerate(nodes_list):
        # Build the Bateman problem (what's inside the time loop in the evolution_solver function)
        updated_compositions = None
        N[i] = updated_compositions
    # Save the results for each time step in a list
    evolution_flux.append(flux)
    evolution_comp.append(N)

# evolution_flux = [[f11, f21, f31, f41, f51], [f12, f22, f32, f42, f52], ...]
plot(time_steps, evolution_flux)
plot(time_steps, evolution_comp, nuclide='U235')
plot(time_steps, evolution_comp, nuclide='Pu239')

