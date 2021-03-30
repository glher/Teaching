This is the stub code for HW3.

You need to replace all the "???" in the code with appropriate code.

- Understand what main.py does
- Modify the input data (nuclear_data, physical_inputs) according to the problem at hand
- Understand what geometry_reader.py does
- Modify material_reader.py to obtain the macroscopic cross-sections and the diffusion coefficient for each material in
your system.
- Understand what solver_reader.py does
- Modify neutronic_solver.py to solve for the flux
- Plot the flux: check that you're getting the shape you expected according to the analytical solution seen in class
- Find out how to scale the flux to obtain the wanted power.


Direct your questions at Guillaume (glher@mines.edu).


Recommendations:

 - I recommend you print a lot of the variables to know what's in them and how to access the values you want. You can use
the debugger for that purpose with any IDE, or use "print" statements.

- You may need to install a few modules. In order to do so:

pip install scipy
pip install numpy
pip install matplotlib

- I recommend using a virtual environment for this (look into virtualenv for python)