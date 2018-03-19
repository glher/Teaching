function [d_coeff, macrosig_a, delta_e] = geometry()

    [diffusion_coefficient, distance, macrosig_a, macrosig_s] = get_diff_coeff();
    d_coeff = [];
    global deltax;
    global len;
    points = linspace(0, len, int32(len/deltax)+1);
    for i = 1:length(points)
        ix = find(distance>points(i),1);
        d_coeff = [d_coeff, diffusion_coefficient(ix)];
    end
    global phi_e;
    if phi_e == 'extrapolated'
        delta_e = 0.7104 * 1./macrosig_s(length(macrosig_s));
        points = [points, len+delta_e];
        d_coeff = [d_coeff, d_coeff(length(d_coeff))];
    end
end

function [diffusion_coefficient, distance, macrosig_a, macrosig_s] = get_diff_coeff()
    filetext = fileread('dat/geometry_sigs.txt');
    filetext = strsplit(filetext,'\n');
    distance = [];
    diffusion_coefficient = [];
    for idx = 1:numel(filetext)
       line_1 = filetext(idx);
       if line_1{1}(1) == '#'
          continue 
       end
       line_2 = strsplit(line_1{1}, ';');
       d = str2double(line_2{1});
       composition = strsplit(line_2{2}, ',');
       numcomp = length(composition);
       macrosig_s = 0.;
       for c = 1:numcomp
           material = strsplit(composition{c}, ':');
           macrosig_s = macrosig_s + str2double(material{1}) * str2double(material{2}) * 1e-24;
       end
       distance = [distance, d];
    end
    
    filetext = fileread('dat/geometry_siga.txt');
    filetext = strsplit(filetext,'\n');
    diffusion_coefficient = [];
    for idx = 1:numel(filetext)
       line_1 = filetext(idx);
       if line_1{1}(1) == '#'
          continue 
       end
       line_2 = strsplit(line_1{1}, ';');
       composition = strsplit(line_2{2}, ',');
       numcomp = length(composition);
       macrosig_a = 0.;
       for c = 1:numcomp
           material = strsplit(composition{c}, ':');
           macrosig_a = macrosig_a + str2double(material{1}) * str2double(material{2}) * 1e-24;
       end
       diffusion_coeff = macrosig_s / (3 * (macrosig_s+macrosig_a)^2);
       diffusion_coefficient = [diffusion_coefficient, diffusion_coeff];
    end
end