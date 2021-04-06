function [] = material_print(fuelIndex)

fileID = fopen('matterials.txt','w');


for k = 1:(length(fuelIndex)/3)


fprintf(fileID, 'mat m%d -11.000000 tmp 1272 burn 1 \n',fuelIndex(k));
fprintf(fileID, '8016.12c 6.6655e-01  \n');
fprintf(fileID, '92235.12c 1.6672e-02 \n');
fprintf(fileID, '92238.12c 3.1678e-01 \n');
fprintf(fileID, '90232.12c 3.8783e-37 \n');
fprintf(fileID, '90233.12c 3.8616e-37 \n');
fprintf(fileID, '90234.12c 3.8451e-37 \n');
fprintf(fileID, '91232.12c 3.8783e-37 \n');
fprintf(fileID, '91233.12c 3.8616e-37 \n');
fprintf(fileID, '92233.12c 3.8616e-37 \n');
fprintf(fileID, '92234.12c 3.8451e-37 \n');
fprintf(fileID, '92236.12c 3.8125e-37 \n');
fprintf(fileID, '92237.12c 3.7965e-37 \n');
fprintf(fileID, '93239.12c 3.7647e-37 \n');
fprintf(fileID, '94236.12c 3.8125e-37 \n');
fprintf(fileID, '94237.12c 3.7965e-37 \n');
fprintf(fileID, '94238.12c 3.7805e-37 \n');
fprintf(fileID, '94239.12c 3.7647e-37 \n');
fprintf(fileID, '94240.12c 3.7490e-37 \n');
fprintf(fileID, '94241.12c 3.7334e-37 \n');
fprintf(fileID, '94242.12c 3.7180e-37 \n');
fprintf(fileID, '94243.12c 3.7027e-37 \n');
fprintf(fileID, '94244.12c 3.6875e-37 \n');
fprintf(fileID, '95241.12c 3.7334e-37 \n');
fprintf(fileID, '95342.12c 2.6309e-37 \n');
fprintf(fileID, '95243.12c 3.7027e-37 \n');
fprintf(fileID, '95244.12c 3.6875e-37 \n');
fprintf(fileID, '96242.12c 3.7180e-37 \n');
fprintf(fileID, '96243.12c 3.7027e-37 \n');
fprintf(fileID, '96244.12c 3.6875e-37 \n');
fprintf(fileID, '96245.12c 3.6725e-37 \n');
fprintf(fileID, '\n');
fprintf(fileID, '\n');

end


for k = (length(fuelIndex)/3)+1:(length(fuelIndex))
    
    
fprintf(fileID, 'mat m%d -10.970389 tmp 1272 burn 1 \n',fuelIndex(k));
fprintf(fileID, '6012.12c 3.3847e-07 \n');
fprintf(fileID, '7014.12c 5.1207e-16 \n');
fprintf(fileID, '7015.12c 1.5076e-08 \n');
fprintf(fileID, '8016.12c 6.6602e-01 \n');
fprintf(fileID, '8017.12c 3.8946e-08 \n');
fprintf(fileID, '9019.12c 1.7589e-20 \n');
fprintf(fileID, '33074.12c 1.5199e-15 \n');
fprintf(fileID, '33075.12c 2.9732e-08 \n');
fprintf(fileID, '35079.12c 1.9086e-11 \n');
fprintf(fileID, '35081.12c 5.5391e-06 \n');
fprintf(fileID, '36078.12c 5.9680e-19 \n');
fprintf(fileID, '36080.12c 1.1072e-11 \n');
fprintf(fileID, '36082.12c 1.9706e-08 \n');
fprintf(fileID, '36083.12c 1.4024e-05 \n');
fprintf(fileID, '36084.12c 2.7213e-05 \n');
fprintf(fileID, '36086.12c 5.6197e-05 \n');
fprintf(fileID, '37085.12c 2.5025e-05 \n');
fprintf(fileID, '37087.12c 6.8972e-05 \n');
fprintf(fileID, '39089.12c 1.0861e-04 \n');
fprintf(fileID, '40090.12c 2.7066e-06 \n');
fprintf(fileID, '40091.12c 1.2861e-04 \n');
fprintf(fileID, '40092.12c 1.6099e-04 \n');
fprintf(fileID, '40093.12c 1.7302e-04 \n');
fprintf(fileID, '40094.12c 1.7726e-04 \n');
fprintf(fileID, '40096.12c 1.7630e-04 \n');
fprintf(fileID, '41093.12c 2.0543e-12 \n');
fprintf(fileID, '42095.12c 1.2894e-04 \n');
fprintf(fileID, '43099.12c 1.6708e-04 \n');
fprintf(fileID, '44101.12c 1.4819e-04 \n');
fprintf(fileID, '44103.12c 1.1307e-05 \n');
fprintf(fileID, '45103.12c 7.9539e-05 \n');
fprintf(fileID, '46105.12c 3.7295e-05 \n');
fprintf(fileID, '47107.12c 7.0843e-13 \n');
fprintf(fileID, '47109.12c 3.4218e-06 \n');
fprintf(fileID, '48106.12c 3.9131e-23 \n');
fprintf(fileID, '48108.12c 1.9677e-12 \n');
fprintf(fileID, '48110.12c 1.8136e-07 \n');
fprintf(fileID, '48111.12c 9.8700e-07 \n');
fprintf(fileID, '48112.12c 6.1070e-07 \n');
fprintf(fileID, '48113.12c 4.0546e-08 \n');
fprintf(fileID, '50120.12c 4.1919e-07 \n');
fprintf(fileID, '53127.12c 4.5604e-06 \n');
fprintf(fileID, '53129.12c 1.6786e-05 \n');
fprintf(fileID, '53135.12c 1.3724e-07 \n');
fprintf(fileID, '54124.12c 1.3760e-22 \n');
fprintf(fileID, '54126.12c 1.4654e-12 \n');
fprintf(fileID, '54129.12c 6.9493e-11 \n');
fprintf(fileID, '54130.12c 1.0072e-07 \n');
fprintf(fileID, '54131.12c 7.8142e-05 \n');
fprintf(fileID, '54132.12c 1.2729e-04 \n');
fprintf(fileID, '54134.12c 2.2202e-04 \n');
fprintf(fileID, '54135.12c 1.0488e-07 \n');
fprintf(fileID, '54136.12c 2.6466e-04 \n');
fprintf(fileID, '55133.12c 1.8287e-04 \n');
fprintf(fileID, '55134.12c 3.1374e-06 \n');
fprintf(fileID, '55135.12c 9.9072e-05 \n');
fprintf(fileID, '55136.12c 4.1550e-08 \n');
fprintf(fileID, '55137.12c 1.7296e-04 \n');
fprintf(fileID, '56138.12c 1.8915e-04 \n');
fprintf(fileID, '59141.12c 1.4681e-04 \n');
fprintf(fileID, '60143.12c 1.4984e-04 \n');
fprintf(fileID, '60145.12c 1.0636e-04 \n');
fprintf(fileID, '60147.12c 1.9438e-06 \n');
fprintf(fileID, '60148.12c 4.8132e-05 \n');
fprintf(fileID, '61147.12c 4.5025e-05 \n');
fprintf(fileID, '61148.12c 6.6893e-08 \n');
fprintf(fileID, '61149.12c 2.0787e-07 \n');
fprintf(fileID, '62147.12c 8.9213e-06 \n');
fprintf(fileID, '62149.12c 1.2900e-06 \n');
fprintf(fileID, '62150.12c 3.0590e-05 \n');
fprintf(fileID, '62151.12c 4.6402e-06 \n');
fprintf(fileID, '62152.12c 1.5026e-05 \n');
fprintf(fileID, '63151.12c 1.1646e-08 \n');
fprintf(fileID, '64152.12c 4.1292e-09 \n');
fprintf(fileID, '64154.12c 1.6641e-08 \n');
fprintf(fileID, '64155.12c 8.2381e-09 \n');
fprintf(fileID, '64156.12c 1.5710e-06 \n');
fprintf(fileID, '64157.12c 1.2230e-08 \n');
fprintf(fileID, '64158.12c 5.2508e-07 \n');
fprintf(fileID, '64160.12c 2.8934e-08 \n');
fprintf(fileID, '67165.12c 5.8248e-10 \n');
fprintf(fileID, '90229.12c 7.8809e-16 \n');
fprintf(fileID, '90230.12c 4.7345e-13 \n');
fprintf(fileID, '90232.12c 2.3446e-11 \n');
fprintf(fileID, '90233.12c 1.8035e-17 \n');
fprintf(fileID, '90234.12c 5.4372e-12 \n');
fprintf(fileID, '91231.12c 2.1854e-11 \n');
fprintf(fileID, '91232.12c 1.5467e-14 \n');
fprintf(fileID, '91233.12c 5.0358e-13 \n');
fprintf(fileID, '92232.12c 2.4879e-12 \n');
fprintf(fileID, '92233.12c 1.3978e-10 \n');
fprintf(fileID, '92234.12c 2.3249e-07 \n');
fprintf(fileID, '92235.12c 1.3573e-02 \n');
fprintf(fileID, '92236.12c 5.4120e-04 \n');
fprintf(fileID, '92237.12c 4.0716e-07 \n');
fprintf(fileID, '92238.12c 3.1539e-01 \n');
fprintf(fileID, '92239.12c 4.7864e-08 \n');
fprintf(fileID, '92240.12c 1.1573e-23 \n');
fprintf(fileID, '93235.12c 1.9230e-14 \n');
fprintf(fileID, '93236.12c 1.6884e-11 \n');
fprintf(fileID, '93237.12c 1.2778e-05 \n');
fprintf(fileID, '93238.12c 9.0270e-09 \n');
fprintf(fileID, '93239.12c 6.9124e-06 \n');
fprintf(fileID, '94236.12c 1.1251e-12 \n');
fprintf(fileID, '94237.12c 1.4128e-12 \n');
fprintf(fileID, '94238.12c 6.0903e-07 \n');
fprintf(fileID, '94239.12c 7.3451e-04 \n');
fprintf(fileID, '94240.12c 7.7035e-05 \n');
fprintf(fileID, '94241.12c 1.6892e-05 \n');
fprintf(fileID, '94242.12c 7.6479e-07 \n');
fprintf(fileID, '94243.12c 5.1397e-11 \n');
fprintf(fileID, '94244.12c 5.7994e-13 \n');
fprintf(fileID, '95241.12c 2.9239e-07 \n');
fprintf(fileID, '95342.12c 7.8329e-10 \n');
fprintf(fileID, '95243.12c 1.8169e-08 \n');
fprintf(fileID, '95244.12c 2.6255e-12 \n');
fprintf(fileID, '96241.12c 2.1697e-16 \n');
fprintf(fileID, '96242.12c 1.4877e-08 \n');
fprintf(fileID, '96243.12c 3.8941e-11 \n');
fprintf(fileID, '96244.12c 5.3452e-10 \n');
fprintf(fileID, '96245.12c 4.2276e-12 \n');
fprintf(fileID, '96246.12c 4.2560e-14 \n');
fprintf(fileID, '96247.12c 4.8830e-17 \n');
fprintf(fileID, '96248.12c 3.2018e-19 \n');
fprintf(fileID, '98249.12c 4.3784e-23 \n');
fprintf(fileID, '\n');
fprintf(fileID, '\n');
end


end