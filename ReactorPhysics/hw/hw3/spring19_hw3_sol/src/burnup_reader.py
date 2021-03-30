import re
from src.tools import MiscFunctions


class BurnupReader:
    """
    This class will read the burnup input deck (physical_inputs/burnup.txt).
    The user will give the burnup command using the following template:

* BEGIN burnup
power 100
steps 5 10 10
* END

    - The first line must always be "* BEGIN burnup". This tells the code that you are defining the burnup information.
    - The second line gives the power in your system. The value is given in MWd/kgHM and should always come in second position.
    - The third line gives the burnup steps you want to compute. These are intervals value. Here, you say you want 3 steps.
    The first step will be from 0 to 5 MWd/kgHM. The second step from 5 to 15MWd/kgHM. The third step from 15 to 25 MWd/kgHM.
    - The last line must always be "* END" in order to tell the code that you are done defining the geometry.

    As an example, say you want to obtain the flux with a burnup calculation after 1 MWd/kgHM, 16 MWd/kg, 30 MWd/kg and 50MWd/kg.
    Consider your system to be 150 MWth.
    In this case, you will have:

* BEGIN burnup
power 150
steps 1 15 14 20
* END
    """

    def __init__(self):
        pass

    def initialize(self):
        """
        This function is the initialization of your system for the burnup parameters. It gets the power of your system
        and the burnup steps you want.
        :return: burnup: Dictionary containing the power and burnup steps information
        """
        burnup = self.read_burnup()
        return burnup

    @staticmethod
    def read_burnup():
        """
        This function reads the burnup information from the input deck by using the delimiters "* BEGIN burnup"
        and "* END".
        It then parses the text in between to know the power and burnup steps needed.
        :return:
        """
        # Open the dat/deck.txt for reading
        with open('physical_inputs/burnup.txt', 'r') as dat:
            # This reads all the lines into one string, so that we can do some treatment on it
            b = dat.read()
        # The regex module (re) finds the text between the delimiters and puts it into "geom".
        burn = re.findall(r'\* BEGIN burnup(.*?)\* END', b, re.DOTALL)[-1]

        # Cleanup the results (by removing empty line or commented lines)
        burn = MiscFunctions.cleanup(burn.split('\n'))
        power = burn[0].split()[1]
        burnup_steps = [float(i) for i in burn[1].split()[1:]]

        burnup = {'power': power,
                  'steps': burnup_steps}

        return burnup
