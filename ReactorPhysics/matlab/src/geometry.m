function [d_coeff] = geometry()

    % Calls a local function to read the geometry file
    [diffusion_coefficient, distance] = get_diff_coeff();
    % Initialize the variable you want to fill and
    % return, d_coeff.
    d_coeff = [];
    % Load the global variables from your workspace.
    global deltax;
    global len;
    % Find the location of your grid points. That is,
    % if len = 50 cm and deltax = 10 cm, then:
    % points = [0, 10, 20, 30, 40, 50]
    points = linspace(0, len, int32(len/deltax)+1);
    % For each grid point location, find the material
    % present according to the real geometry. Obtain
    % the corresponding diffusion coefficient at that
    % grid point.
    for i = 1:length(points)
        % find the index of the real geometry diffusion
        % coefficient array where you have your grid
        % point.
        ix = find(distance>points(i),1);
        d_coeff = [d_coeff, diffusion_coefficient(ix)];
    end
    global phi_e;
    if phi_e == 'extrapolated'
        delta_e = 0.7104 * 1./macrosig(length(macrosig));
        points = [points, len+delta_e];
        d_coeff = [d_coeff, d_coeff(length(d_coeff))];
    end
end

% This function takes no input argument (read the
% geometry file inside of it) and return two variables:
% the list of diffusion coefficient for each line in
% the geometry file and the upper bound distance that
% corresponds.
function [diffusion_coefficient, distance] = get_diff_coeff()
    % Loads the geometry file
    filetext = fileread('dat/geometry.txt');
    % Get all the lines in an array (\n is 'line return')
    filetext = strsplit(filetext,'\n');
    % Initialize the array you want
    distance = [];
    diffusion_coefficient = [];
    % Iterate over the lines in the geometry file
    for idx = 1:numel(filetext)
       % Put the idx-th line in a variable line_1
       line_1 = filetext(idx);
       % If the line starts with a #, do nothing and
       % go to the next line
       if line_1{1}(1) == '#'
          continue 
       end
       % For the selected line, separate right and
       % left of the ;. It puts the results in an
       % array line_2
       line_2 = strsplit(line_1{1}, ';');
       % Takes the first element of line_2, and put
       % the string value into a float. This is our
       % distance (upper bound for the selected line).
       d = str2double(line_2{1});
       % For the second element of the array (recall,
       % in our case that's the (sigma, N) tuples),
       % get each tuple in an array (separate
       % different materials for example)
       composition = strsplit(line_2{2}, ',');
       % Count how many materials (how many cross
       % section and number density 'couples') you
       % have on a line, put this in the variable
       % 'numcomp'.
       numcomp = length(composition);
       % Initialize the macroscopic cross-section to 0
       % Here, we're going to do:
       % Sig = N1*sig_1 + N2*sig_2 + ...
       macrosig = 0.;
       for c = 1:numcomp
           % Split the variable according to the ':'.
           % The first element (material{1}) will be sig,
           % the second (material{2}) will be N
           material = strsplit(composition{c}, ':');
           % Translate a strign to a float (double),
           % don't forget sig is in barn in our file
           macrosig = macrosig + str2double(material{1}) * str2double(material{2}) * 1e-24;
       end
       % for each line, add the variable d (first
       % element of the line) to the 'distance' variable
       % array.
       distance = [distance, d];
       % Compute the diffusion coefficient for the line
       % D = 1 / (3*Sig)
       diffusion_coeff = 1 / (3 * macrosig);
       % for each line, add the variable diffusion_coeff
       % to the 'diffusion_coefficient' variable array.
       diffusion_coefficient = [diffusion_coefficient, diffusion_coeff];
    end
end