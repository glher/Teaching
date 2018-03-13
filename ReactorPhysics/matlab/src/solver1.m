function [flux] = solver1(diffusion_coefficient)
    % Load the global variables from the workspace
    global len;
    global deltax;
    % Define the size of your solver system. If you
    % have len = 50 cm and deltax = 10 cm, then:
    % size = 50/10 - 1 = 4.
    % Your grid has 6 points, but you know two of those
    % points from boundary conditions (phi0 and phi_e)
    size = int32(len/deltax) - 1;
    global phi0;
    global phi_e;
    % Calls the local buildmatrix function. Given a
    % system size and the diffusion coefficient array,
    % it will define the A matrix of A*phi = b 
    matrice_coeff = buildmatrix(size, diffusion_coefficient);
    % Defines the right hand size matrix (vector). Fills
    % it will all zeros.
    rhs = zeros(size, 1);
    % The first term of the RHS vector is not zero, due
    % to the boundary conditions. Recall, that comes from
    % the maths and depends on what equation you want to
    % solve.
    rhs(1) = -(diffusion_coefficient(1) + diffusion_coefficient(2)) * phi0;
    % The last term of the RHS vector is also not 
    % necessarily zero. Get its value based on the math.
    rhs(size) = -(diffusion_coefficient(size-1) + diffusion_coefficient(size)) * phi_e;
    % Calls a Matlab function to solve the matrice
    % equation.
    flux = linsolve(matrice_coeff, rhs);
    % Recall, you solve for a system of a given size,
    % your flux variable is missing the boundary fluxes.
    flux = [phi0; flux; phi_e];
end

function [matrice_coefficients] = buildmatrix(size, diffusion_coefficient)
    matrice_coefficients = [];
    % Loop over each line of the matrix (recall, the
    % matrix size is size*size). Remember, the matrix
    % coefficients are dependent on the math. They only
    % work here for the given equation we want to solve.
    for i = 1:size
        % Say everything on the line is 0.
       line = zeros(1, size);
       % If we are doing the first line, A(1,j),
       % values follow a different "logic" (2 terms
       % only)
       if i == 1
           % write A(1,1)
           line(i) = -(diffusion_coefficient(i) + 2*diffusion_coefficient(i+1) + diffusion_coefficient(i+2));
           % write A(1,2)
           line(i+1) = diffusion_coefficient(i+1) + diffusion_coefficient(i+2);
       % If we are doing the last line, A(size,j),
       % the logic is also different (2 terms only).
       elseif i == size
           % write A(size,1)
           line(i-1) = diffusion_coefficient(i-1) + diffusion_coefficient(i);
           % write A(size,2)
           line(i) = -(diffusion_coefficient(i-1) + 2*diffusion_coefficient(i) + diffusion_coefficient(i+1));
       % For all other line, the logic is similar. We have
       % a tri-diagonal matrix, so (i,i-1), (i,i) and (i,i+1)
       % positions need to be defined.
       else
           % write A(i,i-1)
           line(i-1) = diffusion_coefficient(i) + diffusion_coefficient(i+1);
           % write A(i,i)
           line(i) = -(diffusion_coefficient(i) + 2*diffusion_coefficient(i+1) + diffusion_coefficient(i+2));
           % write A(i,i+1)
           line(i+1) = diffusion_coefficient(i+1) + diffusion_coefficient(i+2);
       end
       % Build the matrix by adding the completed line
       matrice_coefficients = [matrice_coefficients; line];
    end
end

