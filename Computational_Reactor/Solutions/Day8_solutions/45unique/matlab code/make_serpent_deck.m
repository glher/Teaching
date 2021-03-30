function make_serpent_deck()
%MAKE_SERPENT_DECK funtion to make serpent input decks
%   T. Rider 10 Sep 2015
% NOTES:
% CHANGES:
% EXAMPLES:
%% prints pin.txt which is full of fuel pins
[fuelIndex,u] = pin_print();

%% prints materials to mxxx.txt
material_print(fuelIndex);

%% prints assemblies.txt which are the 10x10 fuel pin assemblies
assembly_print(fuelIndex,u);


end