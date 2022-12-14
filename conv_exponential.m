function [T, inprob,sure, meansq, distr] = conv_exponential()
clc
clear all
close all

%% Exponential Distribution
W = 500;
N = 2000;
T = zeros(W,N);

%% Generation of M Realisations
for i = 1: W
expo_transform = exprnd(1,N);
T(i,1:1:N) = transformation(expo_transform);

end

%% in Probability
inprob = zeros(1,length(T));
e = 0.05;
for n = 1:1: N
c = 0;
    for m = 1 : 1 : W
        if ((T(m,n)-1) > e) 
        c = c + 1;
        elseif ((T(m,n)-1) < (-1*e))
        c = c + 1;
        end
    end 
inprob(1,n)= c/W;
end

%% Almost Sure 
K = 0.5;
sure = zeros(1,(K*N));
for n2 = 1:1: (K*N)
c = 0;   
    for m = 1 : 1 : W
        for n1 = n2 : 1 : N
            if ((T(m,n1)-1) > e) 
            c = c + 1;
            break;
            elseif ((T(m,n1)- 1) < (-1*e))
            c = c + 1;
            break;
            end
        end
    end  
sure(1,n2)= c/W;
end

%% Mean Square 

e = (T-1).^2;
meansq = sum(e)/W;

%% in Distribution
d = 0:0.00001:2;
distr = zeros(1,length(d));
n = N;
for t = 1 : 1 : length(d)
c1 = 0;
    for m1 = 1 : 1 : W
        if (T(m1,n)) <= d(t)
        c1 = c1 + 1;
        end
    end
distr(1,t) = c1/W;
end
end