function [flux] = solver1(diffusion_coefficient)
%SOLVER Summary of this function goes here
%   Detailed explanation goes here
    global len;
    global deltax;
    size = int32(len/deltax) - 1;
    global phi0;
    matrice_coeff = buildmatrix(size, diffusion_coefficient);
    rhs = zeros(size, 1);
    rhs(1) = -(diffusion_coefficient(1) + diffusion_coefficient(2)) * phi0;
    flux = linsolve(matrice_coeff, rhs);
    flux = [phi0; flux; 0];
end

function [matrice_coefficients] = buildmatrix(size, diffusion_coefficient)
    matrice_coefficients = [];
    for i = 1:size
       line = zeros(1, size);
       if i == 1
           line(i) = -(diffusion_coefficient(i) + 2*diffusion_coefficient(i+1) + diffusion_coefficient(i+2));
           line(i+1) = diffusion_coefficient(i+1) + diffusion_coefficient(i+2);
       elseif i == size
           line(i-1) = diffusion_coefficient(i-1) + diffusion_coefficient(i);
           line(i) = -(diffusion_coefficient(i-1) + 2*diffusion_coefficient(i) + diffusion_coefficient(i+1));
       else
           line(i-1) = diffusion_coefficient(i) + diffusion_coefficient(i+1);
           line(i) = -(diffusion_coefficient(i) + 2*diffusion_coefficient(i+1) + diffusion_coefficient(i+2));
           line(i+1) = diffusion_coefficient(i+1) + diffusion_coefficient(i+2);
       end
       matrice_coefficients = [matrice_coefficients; line];
    end
end

