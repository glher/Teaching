from geometry import Geometry
from solver import Solver
from graphs import Graphs

geometry = Geometry()
diffusion_coefficients = geometry.run()

solver = Solver()
flux = solver.run(diffusion_coefficients)

graphs = Graphs(flux)
graphs.plot()
