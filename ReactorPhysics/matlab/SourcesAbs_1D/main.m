delta_x = 1.;
phi5 = 1200.;
sigma_a = 9.7e-2;
sigma_s = 4.3e-1;
source = 1300.;

D = sigma_s / (3 * (sigma_a + sigma_s)^2);

a = 1 / delta_x^2;
b = -(2/delta_x^2 + sigma_a/D);
s = -source/D;

A = [a+b, a, 0, 0, 0, 0, 0, 0, 0;
       a, b, a, 0, 0, 0, 0, 0, 0;
       0, a, b, a, 0, 0, 0, 0, 0;
       0, 0, a, b, a, 0, 0, 0, 0;
       0, 0, 0, a, b, a, 0, 0, 0;
       0, 0, 0, 0, a, b, a, 0, 0;
       0, 0, 0, 0, 0, a, b, a, 0;
       0, 0, 0, 0, 0, 0, a, b, a;
       0, 0, 0, 0, 0, 0, 0, a, b];
S = [s; s; s; s; s; s; s; s; s-a*phi5];

flux = linsolve(A, S);
flux = [phi5; flipud(flux); flux(1); flux; phi5];
plot(linspace(-10, 10, 21), flux);
