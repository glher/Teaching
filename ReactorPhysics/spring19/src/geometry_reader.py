# Import the generic package you will need
import re
import numpy as np
from bisect import bisect_left
# Import your own necessary modules, in this case the constants and parameters files.
from simulation_inputs import parameters
from src.tools import MiscFunctions


class GeometryReader:
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

    def initialize(self):
        """
        This function is the initialization of your system for the geometry. It gets the size of your system and
        computes where your solver points are located.
        :return: points: A list of the solver points location
        :return: geometries: The material at each solver points location
        """
        # Read the geometry and use that and the point location to find what material is associated with what solver
        # point.
        geometries = self.read_geometry()
        return geometries

    @staticmethod
    def read_geometry():
        """
        This function reads the geometries information from the input deck by using the delimiters "* BEGIN geometry"
        and "* END".
        It then parses the text in between to know which material is present in the given segments.
        :return: geometries: A dictionary containing the material at each solver point location
        """
        # Open the dat/deck.txt for reading
        with open('physical_inputs/geometry.txt', 'r') as dat:
            # This reads all the lines into one string, so that we can do some treatment on it
            g = dat.read()
        # The regex module (re) finds the text between the delimiters and puts it into "geom".
        geom = re.findall(r'\* BEGIN geometry(.*?)\* END', g, re.DOTALL)

        # Initialize the distance and material list.
        distance = []
        material = []
        # For each geometry defined by the user
        for g in geom:
            # Cleanup the results (by removing empty line or commented lines)
            g = MiscFunctions.cleanup(g.split('\n'))
            # For each line
            for geometry in g:
                # Get the lower bound
                distance.append(float(geometry.split()[0]))
                # Get the upper bound
                distance.append(float(geometry.split()[1]))
                # get the material (twice, for the lower and for the upper bound)
                material.append(geometry.split()[-1])
                material.append(geometry.split()[-1])
        geometries = {'material': material,
                      'distance': distance}

        return geometries
