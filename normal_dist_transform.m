clear
clc 
n = 10000;
X = randn(1, n);
m = 2;
sig = sqrt(2);
X = sig*X + m;

for j = 1:n
    YN(j) = sum(X(1:j));
    YN(j) = YN(j)/j;
end

Mn = mean(YN);
Sn = std(YN);
%nbins = round(1+3.322*log10(n));
nbins = 500;
minYN = min(YN);
maxYN = max(YN);
e = linspace(minYN,maxYN,nbins+1);
H = histc(YN,e);
H(nbins) = H(nbins)+H(nbins+1);
H = H(1:nbins); % resize H
bw = (maxYN-minYN)/nbins; % bin width
a = e(1:nbins); % left edge sequence
b = e(2:nbins+1); % right edge sequence
bin_centers = (a+b)/2; % bin centers
bar(bin_centers,H/(bw*n),'hist')
hold on
t = linspace(min(YN),max(YN),150);
hold off
fprintf('Mn: %d\n', Mn);
fprintf('Sn: %d\n', Sn);