clear
clc 
n = 10000;
w = rand(1, n);
w = -log(w)/2;
for j = 1:n
    X(j) = sum(w(1:j));
    X(j) = X(j)/j;
end
Mn = mean(X);
Sn = std(X);
nbins = round(1+3.322*log10(n));
minX = min(X);
maxX = max(X);
e = linspace(minX,maxX,nbins+1);
H = histc(X,e);
H(nbins) = H(nbins)+H(nbins+1);
H = H(1:nbins); % resize H
bw = (maxX-minX)/nbins; % bin width
a = e(1:nbins); % left edge sequence
b = e(2:nbins+1); % right edge sequence
bin_centers = (a+b)/2; % bin centers
bar(bin_centers,H/(bw*n),'hist')
hold on
t = linspace(min(X),max(X),150);
hold off
fprintf('Mn: %d\n', Mn);
fprintf('Sn: %d\n', Sn);