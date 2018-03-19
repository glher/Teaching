addpath('src')
addpath('cst')
parameters();
[diffusion_coefficient, macrosig_a, delta_e] = geometry();
flux = solver1(diffusion_coefficient, macrosig_a, delta_e);
graphs(flux)

