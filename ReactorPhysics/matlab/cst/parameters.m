% The variable len represents the size of the 1D system
% over the axis x. Here, it is 50 cm.
global len;
len = 50.;
% The variable deltax represents the interval between
% each point on the grid (hence the number of points),
% from 0 to len. Here, a point every 10 centimeters.
global deltax;
deltax = 10.;
% The variable phi0 is the boundary conditions on the
% left hand side of the geometry problem (x = 0 cm).
global phi0;
phi0 = 1000.;
% The variable phi_e is the boundary conditions on the
% right hand side of the geometry problem (x= len cm).
global phi_e;
phi_e = 'extrapolated';
global phi_e_val;
phi_e_val = 0.;