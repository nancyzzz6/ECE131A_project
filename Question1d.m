% Question 1d

% Create an array for the times of tosses we want to try
times_tosses = [50, 100, 1000, 2000, 3000, 10000, 100000];

for i = 1:length(times_tosses)
    % set the initial times of odds to 0,1
     times_odds = 0;
    for j = 1:times_tosses(i)
        % assume that 1-5 represents even, 6-15 represents odd,
         outcome = randi(15);
        if outcome > 5
            times_odds = times_odds+1;
        end
        
    end
    prob_odd = times_odds / times_tosses(i);
    disp(prob_odd);
end
