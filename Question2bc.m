% upload data from data.txt
data = load('data.txt');
x = data';
n = 100000;


% Part b

% Find the mu in the data
mu_MLE = sum(x) / n;

% Find the sigma in the data
sigma_MLE = sqrt(sum((x - mu_MLE).^2) / n);

% show mu and sigma
display(mu_MLE)
display(sigma_MLE)



% Part c
x_range = linspace(min(x), max(x), 500);
% Plot histogram 
histogram(x, 'Normalization', 'pdf',FaceColor="#4DBEEE");
hold on;
% pdf formula
pdf_Xi = 1/(sigma_MLE * sqrt(2*pi))*exp(-(x_range - mu_MLE).^2 ...
               / (2*sigma_MLE^2));

% Plot PDF
plot(x_range, pdf_Xi,Color= "#A2142F");
title('Histogram and PDF of Data');
xlabel('X');
ylabel('PDF');
legend('Histogram', 'Gaussian Distribution');
hold off;