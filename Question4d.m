% part da 
num_samples = [1 2 3 10 30 100]; 

% generating samples
for i = 1:length(num_samples)
    Zn = zeros(1,num_samples(i));
    for j = 1:num_samples(i)
        % define the PMF of the 10-sided die
        prob_each_side = [2/15 1/15 2/15 1/15 2/15 1/15 2/15 1/15 2/15 1/15];
        X = randsample(1:10, num_samples(i),true, prob_each_side);
        Zn(j) = mean(X); 
    end
    subplot(2, 3, i);
    histogram(Zn, 'Normalization', 'pdf', 'BinWidth', 1/(num_samples(i)+1));
    xlim([1 10]);
    xlabel('X')
    title(['PDF Z',num2str(num_samples(i))]);
    hold on;



    % part db
    mu = sum(prob_each_side.*[1:10]);
    var = sum(prob_each_side.*([1:10] - mu).^2);
    display(mu)
    display(var)




% pard dc
    % find the mean and std of Zn 
    mu_Zn = mean(Zn);
    sigma_Zn = std(Zn);
    x = linspace(min(Zn), max(Zn), 100);
    % use the nirmpdf to draw the gaussian
    y = normpdf(x, mu_Zn, sigma_Zn);
    plot(x, y, 'LineWidth', 2);
    legend('Histogram', 'Gaussian');
    hold off;
end

