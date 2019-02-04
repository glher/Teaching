# Import the generic package you will need
import re
import numpy as np
from bisect import bisect_left
# Import your own necessary modules, in this case the constants and parameters files.
from simulation_inputs import parameters


class SolverReader:
    """
    This class will read the geometry input deck (physical_inputs/geometry.txt) and compute several information on the
    materials given by the user.
    The user will give each material using the following template:

* BEGIN geometry
0 0.05 mat1
0.05 50 mat2
* END

    - The first line must always be "* BEGIN geometry". This tells the code that you are defining a new geometry.
    - The second and third lines give the initial and final x for a segment and the material name that is associated to it.
    - The last line must always be "* END" in order to tell the code that you are done defining the geometry.

    As an example, say you have defined two materials, a material "water" and a material "fuel". Consider that you want a line
    from 0 to 50 cm, with water from 0 to 10 cm and fuel from 10 to 50 cm. In this case, you will have:

* BEGIN geometry
0 10 water
10 50 fuel
* END
    """

    def __init__(self, geometry):
        """
        Initialize the class, with access to the geometry object
        :param geometry: Dictionary containing the points locations and corresponding materials for the solver.
        """
        self.geometry = geometry

    def initialize(self):
        """
        This function is the initialization of your system for the geometry. It gets the size of your system and
        computes where your solver points are located.
        :return: points: A list of the solver points location
        :return: geometries: The material at each solver points location
        """

        # Compute the solver points locations
        points_location = self.get_solver_points()
        # Read the geometry and use that and the point location to find what material is associated with what solver
        # point.
        points_material = self.get_solver_geometry(points_location)
        return points_location, points_material

    def get_solver_points(self):
        """
        Create the space of points given your solver precision and your system size.
        :return: points: A list of the solver points location
        """
        length = self.geometry['distance'][-1]

        points = np.linspace(0, length, int(length / parameters.deltax) + 1)
        return points

    def get_solver_geometry(self, points):

        # Initialize mat_point
        mat_point = []
        # For each solver point location
        for i in points:
            # Find in between which bounds from the user-defined geometry it lies
            idx = bisect_left(self.geometry['distance'], i)
            # Get the material at that location
            mat_point.append(self.geometry['material'][idx])

        return mat_point
