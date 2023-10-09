% Question3
% part a
data = readmatrix('user_data.csv');
B = data(:,1);
T = data(:,2);
S = data(:,3); 
A = data(:,4); 

% Estimate PMF of B,T,S,A
pmfB = histcounts(B, 2, 'Normalization', 'probability');
pmfT = histcounts(T, 3, 'Normalization', 'probability');
pmfS = histcounts(S, 2, 'Normalization', 'probability');
[pmfA, edgesA] = histcounts(A, min(A):10:ceil(max(A)/10)*10, ...
    'Normalization', 'probability');

% show the PMFs
disp(pmfB)
disp(pmfT)
disp(pmfS)
disp(pmfA)

% Plot PMFs
figure;
% PMF of B
subplot(2,2,1); 
bar([0 1], pmfB); 
title('PMF of B');
% PMF of T
subplot(2,2,2);
bar(1:3, pmfT); 
title('PMF of T');
% PMF of S
subplot(2,2,3); 
bar([0 1], pmfS); 
title('PMF of S');
% PMF of A
subplot(2,2,4); 
bar(edgesA(1:end-1), pmfA); 
title('PMF of A');





% part b

T0 = T(B==0);
T1 = T(B==1);
S0 = S(B==0);
S1 = S(B==1);
A0 = A(B==0);
A1 = A(B==1);

% Find conditional PMFs
pmf_T0 = histcounts(T0, 3, 'Normalization', 'probability');
pmf_T1 = histcounts(T1, 3, 'Normalization', 'probability');
pmf_S0 = histcounts(S0, 2, 'Normalization', 'probability');
pmf_S1 = histcounts(S1, 2, 'Normalization', 'probability');
[pmf_A0,edgesA0] = histcounts(A0, min(A):10:ceil(max(A)/10)*10, ...
    'Normalization', 'probability');
[pmf_A1,edgesA1] = histcounts(A1, min(A):10:ceil(max(A)/10)*10, ...
    'Normalization', 'probability');

figure;
% plot of PMF T|B=0
subplot(2,3,1); 
bar(1:3, pmf_T0);
title('PMF of T|B=0');

% plot of PMF T|B=1
subplot(2,3,2); 
bar(1:3, pmf_T1);
title('PMF of T|B=1');

% plot of PMF S|B=0
subplot(2,3,3); 
bar([0 1], pmf_S0);
title('PMF of S|B=0');

% plot of PMF S|B=1
subplot(2,3,4);
bar([0 1], pmf_S1); 
title('PMF of S|B=1');

% plot of PMF A|B=0
subplot(2,3,5);
bar(edgesA0(1:end-1), pmf_A0); 
title('PMF of A|B=0');

% plot of PMF A|B=1
subplot(2,3,6); 
bar(edgesA1(1:end-1),pmf_A1); 
title('PMF of A|B=1');






% part c
% P(B = 0,T = 1,S = 0,A ≤ 55)
p_B0_T1_S0_A55 = pmf_T0(2) * pmf_S0(1) * sum(pmf_A0(edgesA0 <= 55));

% P(B = 1,T = 1,S = 0,A ≤ 55)
p_B1_T1_S0_A55 = pmf_T1(2) * pmf_S0(1) * sum(pmf_A1(edgesA1 <= 55));

display(p_B0_T1_S0_A55)
display(p_B1_T1_S0_A55)







% part d
% P(A|B)=P(AnB)/P(B)
p_B0_given_T1_S0_A55 = p_B0_T1_S0_A55/(p_B0_T1_S0_A55 + p_B1_T1_S0_A55);
display(p_B0_given_T1_S0_A55)