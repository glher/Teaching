import numpy as np
import data
import matplotlib.pyplot as plt


def plotit(name, x, y, color='blue'):
    """
    Plot the graphs for each nuclide
    :param name: Name of the nuclide top plot
    :param x: time steps
    :param y: N_nuclide
    :param color: Color of the graph
    :return:
    """

    fig, ax = plt.subplots()
    ax.plot(x, y[name], color=color)
    ax.set_title(name)
    ax.set_yscale('log')
    ax.set(xlabel='days', ylabel='N')
    plt.savefig('graphs/{}.png'.format(name))
    plt.close()


def compute_reaction_rate_matrix(nuc, f):
    """
    This function obtain the reaction rate matrix A in A * X = B, or here: A * N+1 = N
    It needs the microscopic cross-sections

    This function doesn't care about the mesh, only about the initial composition and flux at a time. This can be
    seen as a point solver.

    Note that the Bateman equations are hard-coded, so the list cannot simply be modified to change the chain. The list
    is used to get the matrix with the element at the right position.

    Be careful with the units. If you give the microscopic cross-sections in barns, you have to translate to cm2. Or use
    a flux in n.barn-1.s-1. Also mind the unit of time, in seconds here.

    :param nuc: List of nuclides to consider
    :param f: Flux (n.cm-2.s-1)
    :return:
    """

    xs = data.microscopic_cross_sections
    fy = data.fission_yield

    rrm = np.zeros((len(nuc), len(nuc)))

    # U235
    rrm[nuc.index('U235'), nuc.index('U235')] = - 1e-24 * f * (xs['U235']['xs_absorption'] + xs['U235']['xs_fission'])

    # U238
    rrm[nuc.index('U238'), nuc.index('U238')] = - 1e-24 * f * xs['U238']['xs_absorption']

    # Pu239
    rrm[nuc.index('Pu239'), nuc.index('U238')] = 1e-24 * f * xs['U238']['xs_absorption']
    rrm[nuc.index('Pu239'), nuc.index('Pu239')] = - 1e-24 * f * (xs['Pu239']['xs_absorption'] + xs['Pu239']['xs_fission'])

    # Xe135
    rrm[nuc.index('Xe135'), nuc.index('Xe135')] = - 1e-24 * f * xs['Xe135']['xs_absorption'] - xs['Xe135']['lambda']
    rrm[nuc.index('Xe135'), nuc.index('U235')] = 1e-24 * f * fy['Xe135'] * xs['U235']['xs_fission']
    rrm[nuc.index('Xe135'), nuc.index('Pu239')] = 1e-24 * f * fy['Xe135'] * xs['Pu239']['xs_fission']

    # Lumped Fission Products
    rrm[nuc.index('lumped_FP'), nuc.index('U235')] = 1e-24 * f * (2 - fy['Xe135']) * xs['U235']['xs_fission']
    rrm[nuc.index('lumped_FP'), nuc.index('Pu239')] = 1e-24 * f * (2 - fy['Xe135']) * xs['Pu239']['xs_fission']

    return rrm


def evolution_solver(compositions, rrm, steps, nuc):
    """
    DGESV solver. This solves Ax = B, with A the reaction rate matrix and B the initial compositions.

    :param compositions: Initial composition
    :param rrm: reaction rate matrix expressing the Bateman system
    :param steps: time steps to calculate
    :param nuc: Tracked nuclides (size of the system)
    :return:
    """
    evolution = [compositions]
    for i, dt in enumerate(steps):
        rrm_id = np.identity(len(nuc)) - dt * rrm
        compositions = np.linalg.solve(rrm_id, compositions)

        evolution.append(compositions)
    return evolution


def plot_manager(x, evolution, nuc):
    """
    Organizes the plots

    :param x: x-axis (cumulative time)
    :param evolution: Composition over time for each nuclide tracked
    :param nuc: Tracked nuclides to plot
    :return:
    """
    y = {}
    for i, nuclide in enumerate(nuc):
        y[nuclide] = [n[i] for n in evolution]

    plotit('U235', x, y, color='blue')
    plotit('U238', x, y, color='orange')
    plotit('Pu239', x, y, color='green')
    plotit('Xe135', x, y, color='red')
    plotit('lumped_FP', x, y, color='black')


if __name__ == '__main__':
    tracked = ('U235', 'U238', 'Pu239', 'Xe135', 'lumped_FP')

    initial_compositions = [1e20, 2.4e21, 0, 0, 0]
    flux = 1e17
    delta_t = 86400.
    simulation_time = 100
    time_steps = [delta_t] * simulation_time
    time_days = np.cumsum([0] + [1] * simulation_time)

    reaction_rate_matrix = compute_reaction_rate_matrix(tracked, flux)
    evolution_compositions = evolution_solver(initial_compositions, reaction_rate_matrix, time_steps, tracked)
    plot_manager(time_days, evolution_compositions, tracked)
