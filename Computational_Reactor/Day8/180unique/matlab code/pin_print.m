function [matNumb,u] = pin_print()
%PIN_PRINT funtion to make pins.txt which is full of fuel pins
%   T. Rider 10 Sep 2015
% NOTES:
% CHANGES:
% EXAMPLES:
%%

matNumb = 11:1:190;

u = matNumb;
%%

fileID = fopen('pins.txt','w');
for i = 1:length(u)
fprintf(fileID, 'pin %0.0f \n',u(i));
fprintf(fileID, 'm%dp%dr1        0.396 \n',matNumb(i),matNumb(i));
fprintf(fileID, 'void         0.416 \n');
fprintf(fileID, 'm2    0.466 \n');
fprintf(fileID, 'm3 \n');
fprintf(fileID, '\n');
end



end