"""
    File name: parameters.py
    Author: Guillaume L'HER
    Date created: 2/3/2018
    Date last modified: 2/4/2018
    Python Version: 3.5
"""

# Define the step for your solver points (cm). For example, if length = 50 and deltax = 1, you will have 50 regions and
# 51 points:
# 0 cm, 1 cm, 2 cm, 3 cm, 4 cm, ..., 50 cm
deltax = 1.
# Define your initial flux
phi0 = 1000.
# Define your iterations limit for the solvers
iterations_limit = 100000
# Here, you can either select a Gauss-Seider solver or you can select a Tri-Diag solver.
# solver = 'gauss-seidel'
solver = 'tridiag'

# Define how much information you want to print when running your program (0: none, 1: little, 2: more, 3: full on,
# usually, or as defined in your code)
verbose = 1

# Define the burnup steps you want to have, in MWd/kg, as well as your power, in MWth.
power = 100
burnup_steps = [10, 10, 10, 10, 10, 10]