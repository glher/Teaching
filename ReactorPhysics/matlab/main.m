% Adds the path necessary for Matlab to find the
% functions you are going to call.
addpath('src')
addpath('cst')
% Loads the global parameters of the problem
parameters();
% Reads the geometry and obtain the diffusion
% coefficients at every point of the solver grid.
diffusion_coefficient = geometry();
% Solves the system of equation
flux = solver1(diffusion_coefficient);
% Graphs the solution of the flux.
graphs(flux)

