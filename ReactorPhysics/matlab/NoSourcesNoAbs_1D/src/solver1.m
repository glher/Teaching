function [flux] = solver1(diffusion_coefficient, macrosig_a, delta_e)
    global len;
    global deltax;
    global phi0;
    global phi_e;
    global phi_e_val;
    if phi_e ~= 'extrapolated'
        size = int32(len/deltax) - 1;
    else
        size = int32(len/deltax);
    end
    matrice_coeff = buildmatrix(size, diffusion_coefficient, macrosig_a, delta_e);
    rhs = zeros(size, 1);
    rhs(1) = -(diffusion_coefficient(1) + diffusion_coefficient(2)) * phi0;
    if phi_e ~= 'extrapolated'
        rhs(size) = -(diffusion_coefficient(size-1) + diffusion_coefficient(size)) * phi_e;
        flux = linsolve(matrice_coeff, rhs);
        flux = [phi0; flux; phi_e];
    else
        rhs(size) = -(diffusion_coefficient(size-1) + diffusion_coefficient(size)) * phi_e_val;
        flux = linsolve(matrice_coeff, rhs);
        flux = [phi0; flux];
    end
        
    
end

function [matrice_coefficients] = buildmatrix(size, diffusion_coefficient, macrosig_a, delta_e)
    matrice_coefficients = [];
    
    global deltax;
    for i = 1:size
       line = zeros(1, size);
       if i == 1
           line(i) = -(diffusion_coefficient(i) + 2*diffusion_coefficient(i+1) + diffusion_coefficient(i+2) + 2*macrosig_a*deltax^2);
           line(i+1) = diffusion_coefficient(i+1) + diffusion_coefficient(i+2);
       elseif i == size
           line(i-1) = diffusion_coefficient(i-1) + diffusion_coefficient(i);
           line(i) = -(diffusion_coefficient(i-1) + 2*diffusion_coefficient(i) + diffusion_coefficient(i+1) + 2*macrosig_a*delta_e^2);
       else
           line(i-1) = diffusion_coefficient(i) + diffusion_coefficient(i+1);
           line(i) = -(diffusion_coefficient(i) + 2*diffusion_coefficient(i+1) + diffusion_coefficient(i+2) + 2*macrosig_a*deltax^2);
           line(i+1) = diffusion_coefficient(i+1) + diffusion_coefficient(i+2);
       end
       matrice_coefficients = [matrice_coefficients; line];
    end
end

