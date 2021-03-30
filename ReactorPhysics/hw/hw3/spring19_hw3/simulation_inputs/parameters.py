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
# Define your nu value (note that eventually, it will be moved to a "nuclear_data" file and read from material_reader.py
nu = 2.4

# Define how much information you want to print when running your program (0: none, 1: little, 2: more, 3: full on,
# usually, or as defined in your code)
verbose = 1