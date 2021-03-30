import numpy as np
import matplotlib.pyplot as plt
from inputs import data, materials, simulation


def compute_reaction_rate_matrix(nuc, f):

    rrm = np.zeros((len(nuc), len(nuc)))

    xs = data.microscopic_cross_sections
    fy = data.fission_yield

    # U235
    rrm[nuc.index('U235'), nuc.index('U235')] = - 1e-24 * f * (xs['U235']['xs_absorption']
                                                               + xs['U235']['xs_fission'])

    # U238
    rrm[nuc.index('U238'), nuc.index('U238')] = - 1e-24 * f * xs['U238']['xs_absorption']

    # Pu239
    rrm[nuc.index('Pu239'), nuc.index('Pu239')] = - 1e-24 * f * (xs['Pu239']['xs_absorption']
                                                                 + xs['Pu239']['xs_fission'])
    rrm[nuc.index('Pu239'), nuc.index('U238')] = 1e-24 * f * xs['U238']['xs_absorption']

    # Xe135
    rrm[nuc.index('Xe135'), nuc.index('Xe135')] = - 1e-24 * f * xs['Xe135']['xs_absorption'] - xs['Xe135']['lambda']
    rrm[nuc.index('Xe135'), nuc.index('U235')] = f * 1e-24 * fy['Xe135'] * xs['U235']['xs_fission']
    rrm[nuc.index('Xe135'), nuc.index('Pu239')] = f * 1e-24 * fy['Xe135'] * xs['Pu239']['xs_fission']

    # Lumped fission products
    rrm[nuc.index('lumped_FP'), nuc.index('U235')] = 1e-24 * f * (2 - fy['Xe135']) * xs['U235']['xs_fission']
    rrm[nuc.index('lumped_FP'), nuc.index('Pu239')] = 1e-24 * f * (2 - fy['Xe135']) * xs['Pu239']['xs_fission']

    return rrm


def evolution_solver(compositions, rrm, steps, nuc):
    # We want to solve for x in: Ax = B ;
    # A * N(t+1) = N(t)
    # Ax = B --> A : rrm_id, B : previous step composition
    evolution = [compositions]
    for i, dt in enumerate(steps):
        # We need to move things around with the reaction rate matrix
        rrm_id = np.identity(len(nuc)) - dt * rrm
        # We calculate and update "compositions" with the result for the next time step
        compositions = np.linalg.solve(rrm_id, compositions)
        # We append the result to the main result list, which will contain all compositions over time
        evolution.append(compositions)
    return evolution


def plot_manager(x, evolution, nuc):
    # Plot for all the different nuclides
    y = {}
    for i, nuclide in enumerate(nuc):
        y[nuclide] = [n[i] for n in evolution]

    plotit('U235', x, y, color='blue')
    plotit('U238', x, y, color='orange')
    plotit('Pu239', x, y, color='green')
    plotit('Xe135', x, y, color='red')
    plotit('lumped_FP', x, y, color='black')


def plotit(name, x, y, color='blue'):

    fig, ax = plt.subplots()
    ax.plot(x, y[name], color=color)
    ax.set_title(name)
    ax.set_yscale('log')
    ax.set(xlabel='days', ylabel='N')
    plt.savefig('graphs/{}.png'.format(name))
    plt.close()


if __name__ == '__main__':

    tracked = ('U235', 'U238', 'Pu239', 'Xe135', 'lumped_FP')

    initial_compositions = []
    for nuclide in tracked:
        # Get the corresponding number density from an input file.
        initial_compositions.append(materials.number_densities['fuel'][nuclide])
    # The flux is given is #.cm-2.s-1
    # This means that delta_t must be in seconds, and that the cross-sections must be in cm2
    flux = 1e17
    delta_t = simulation.delta_t
    simulation_time = simulation.simulation_time
    # We get a list of the timesteps. Here, all the timesteps are the same.
    time_steps = [delta_t] * simulation_time  # [86400, 86400, ..., 86400]

    reaction_rate_matrix = compute_reaction_rate_matrix(tracked, flux)
    evolution_compositions = evolution_solver(initial_compositions, reaction_rate_matrix, time_steps, tracked)
    # Note that the variable evolution_compositions contains a list of list, with one list that was calculated
    # per timestep:
    # [ [1e20, 2.4e21, 0, 0, 0], [...], [...], ... ]

    # We compute a list of the days (for plotting purposes)
    time_days = np.cumsum([0] + [1] * simulation_time)  # --> [0, 1, 2, 3, ..., 100] days
    plot_manager(time_days, evolution_compositions, tracked)
