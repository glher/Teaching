function assembly_print(fuelIndex,u)
%ASSEMBLY_PRINT funtion to make assemblies.txt which are the 10x10 fuel pin assemblies
%   T. Rider 11 Sep 2015
% NOTES:
% CHANGES:
% EXAMPLES:
%%
waterU = 202;
guideT = 201;
assemblyU = 211:211+length(u);
fileID = fopen('assemblies.txt','w');
waterEdge = ones(length(u),10)*waterU;
assemblyCenter = ones(length(u),80);

%% Make assemblies of single fuel type
for k = 1:length(u)


for i = 1:length(assemblyCenter(k,:))
    if mod(i,10) == 1 || mod(i,10) == 0
        assemblyCenter(k,i) = waterU;
    elseif i == 24 || i == 27 || i == 54 || i == 57
        assemblyCenter(k,i) = guideT;
    else
        assemblyCenter(k,i) = u(k);
    end
end
assemblyLayout = [waterEdge, assemblyCenter, waterEdge];


fprintf(fileID, 'lat %d 1 0.0 0.0 10 10 1.3 \n',assemblyU(k));
fprintf(fileID, '%d %d %d %d %d %d %d %d %d %d\n',assemblyLayout(k,:));
fprintf(fileID, '\n');
fprintf(fileID, '\n');


end


%% Stack assemblies into ends, mid, center, mid, ends lattices
%{
endsA   = assemblyU(1:length(u)/3);
midA    = assemblyU(length(u)/3+1:length(u)*2/3);
centerA = assemblyU(length(u)*2/3+1:length(u));
latU = 100:99+length(endsA);

for i = 1:length(latU)
    fprintf(fileID, 'lat %d 9 0.0 0.0 5 \n',latU(i));
    fprintf(fileID, '0.0     %d \n',endsA(i));
    fprintf(fileID, '21.335  %d \n',midA(i));
    fprintf(fileID, '93.874  %d \n',centerA(i));
    fprintf(fileID, '332.826 %d \n',midA(i));
    fprintf(fileID, '405.365 %d \n',endsA(i));
    fprintf(fileID, '\n');
    fprintf(fileID, '\n');
end
%}


end