
 deltax = 1.;
 phi5 = 0.;
 sigma_a = 9.7e-2;
 sigma_s = 4.3e-1;
 source = 10.;
 
 D = sigma_s / (3 * (sigma_a + sigma_s)^2);
 a = 1 / deltax^2;
 b = -(2/deltax^2 + sigma_a/D);
 source = -source/D;
 
 A = [a+b, a, 0, 0, 0, 0, 0, 0, 0;
      a,   b, a, 0, 0, 0, 0, 0, 0;
      0,   a, b, a, 0, 0, 0, 0, 0;
      0,   0, a, b, a, 0, 0, 0, 0;
      0,   0, 0, a, b, a, 0, 0, 0;
      0,   0, 0, 0, a, b, a, 0, 0;
      0,   0, 0, 0, 0, a, b, a, 0;
      0,   0, 0, 0, 0, 0, a, b, a;
      0,   0, 0, 0, 0, 0, 0, a, b;];
S = [source;source;source;source;source;source;source;source;source];
 
flux = linsolve(A, S);
 
flux = [phi5; flipud(flux); flux(1); flux; phi5];

plot(linspace(-10, 10, 21), flux);
hold on
plot(linspace(-10, 10, 21), flux(10) * cos(pi/20 * linspace(-10, 10, 21)));
hold off

