% Question 1a

% Create an array for the times of tosses we want to try
times_tosses = [50, 100, 1000, 2000, 3000, 10000, 100000];

for i = 1:length(times_tosses)
    % set the initial times of odds to 0, 
    times_odds = 0;
    num_tosses = times_tosses(i);
    
    % for each group of trails, randomly draw numbers 
    % and record times of odds 
    for j = 1:num_tosses
        outcome = randi(10);
        if mod(outcome,2) == 1
            times_odds = times_odds+1;
        end
    end
    
    % Compute estimated probability of obtaining an odd number
    prob_odds = times_odds / num_tosses;
    disp(prob_odds)
    % fprintf('Tosses: %d, Estimated probability of odd number: %.4f\n', times_tosses, prob_odds);
end