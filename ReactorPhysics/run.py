from src.geometry import Geometry
from src.solver import Solver
from src.graphs import Graphs

geometry = Geometry()
diffusion_coefficients = geometry.run()

solver = Solver()
flux = solver.run(diffusion_coefficients)

graphs = Graphs(flux)
graphs.plot()
