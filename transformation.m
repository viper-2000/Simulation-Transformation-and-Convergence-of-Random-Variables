function TS = transformation(X)
sum1 = 0;
s = zeros(1,length(X));
TS = zeros(1,length(X));
for i = 1 :1: length(X)
        s(i) = sum1 + X(i);
        sum1 = s(i);
        TS(i) = s(i)/i; 
end
end