# Cross-section in barns; lambda in s-1
microscopic_cross_sections = {
    'U235': {'xs_fission': 1.55,
             'xs_absorption': 0.38},
    'U238': {'xs_absorption': 0.2},
    'Pu239': {'xs_fission': 1.6,
              'xs_absorption': 0.28},
    'Xe135': {'xs_absorption': 1e6,
              'lambda': 3e-5}
}

fission_yield = {'Xe135': 0.06}
