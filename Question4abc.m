% Question4

% part a 
num_samples = [1 2 3 10 30 100]; 

% generating samples
for i=1:length(num_samples)
    Zn = zeros(1,num_samples(i));
    for j=1:num_samples(i)
        X = unifrnd(3,7,1,num_samples(i)); 
        Zn(j) = mean(X); 
    end
    subplot(2,3,i);
    histogram(Zn,'Normalization','pdf');
    xlim([3 7]);
    xlabel('X')
    title(['PDF Z',num2str(num_samples(i))]);



    % part b
    mu = (3+7)/5;
    var = (7-3)^2/12; 
    
    display(mu)
    display(var)

   % Part (c)
    hold on;
    % find the mean and std of Zn 
    mu_Zn = mean(Zn);
    sigma_Zn = std(Zn);
    x = linspace(min(Zn), max(Zn), 1000);
    % use the nirmpdf to draw the gaussian
    y = normpdf(x, mu_Zn, sigma_Zn);
    plot(x, y, 'LineWidth', 2.5);
    hold off;
end
