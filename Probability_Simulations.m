clear all
close all
clc

%% Calculating The Value of Pi Using Probability!

trials = 1e6;

% Generate unit circle for plotting
t = 0:0.01:2*pi;
x = cos(t);
y = sin(t);

% Generate uniformly random (x,y) pairs inside a square of side length 1
x_o = -1 + 2*rand(1, trials);
y_o = -1 + 2*rand(1, trials);

% Find how many points landed inside the unit circle
g = x_o.^2 + y_o.^2;
inside_circle = find(g <= 1);

% Based on ratio of points landing inside circle to total points inside
% square we calculate the value of pi
Pie = 4*length(inside_circle)/ length(x_o)


% Plot what's going on
scatter(x_o, y_o,'r')
hold on
plot(x, y, 'b')
axis([-1 1 -1 1])
title('Calculating The Value of Pi Using Probability')

%% Monty Hall Problem

% Case I: We do not switch
prize = 1;
trials = 1e6;
wins = 0;
for i = 1:trials
    doors = randperm(3);
    you_pick = doors(1);
    if you_pick == prize
        wins = wins + 1;
    end
end

we_dont_switch = wins/trials
    
%% Case II: We switch   
prize = 1;
trials = 1e6;
wins = 0;
for i = 1:trials
    doors = randperm(3);
    you_pick = doors(1);
    if doors(2) ~= prize
        we_show = doors(2);
        you_pick = doors(3);
    elseif doors(3) ~= prize
        we_show = doors(3);
        you_pick = doors(2);
    end
    
    if you_pick == prize
        wins = wins + 1;
    end
end

we_switch = wins/trials

%% The Birthday Paradox

n = 365;
k = 23;
trials = 1e5;
same = 0;
r = randi(n,k,trials);
for jj = 1:trials
    bucket = zeros(1,n);
    for ii = 1:k
        bucket(r(ii,jj)) = 1;
    end
    if(sum(bucket) ~= k)
        same = same+1;
    end
end

birthday_probability = (trials-same)/trials