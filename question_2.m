clc;
clear;

syms x y;
%the matrix calcultion by hand matches the one done by code 
fxy = @(x,y)x+(3/2)*y.^2; % Given pdf function
fx = (int(fxy,y,[0,1])); %Marginal pdf x
fy=(int(fxy,x,[0,1])); %Marginal pdf y

Ex=(int(x*fx,x,[0,1])); %Expectation of X
Ey=(int(y*fy,y,[0,1])); %Expectation of Y

Ex2=(int(x^2*fx,x,[0,1])); % 2nd Moment of X
Ey2=(int(y^2*fy,y,[0,1])); % 2nd Moment of Y

Varx=(Ex2-(Ex^2)); %Variance of X
Vary=(Ey2-(Ey^2)); %Variance of Y


p=@(x,y) x.^2.*y+(3/2)*y.^3.*x; 
Exy=(integral2(p,0,1,0,1));
covxy=((Exy-(Ex*Ey))); %Covariance Coefficient


Cov_mat=([Varx covxy; covxy Vary]);
Cov_mat1=round(Cov_mat,5);
disp(Cov_mat1);

v = covxy/sqrt(Varx*Vary);
Correlation=[1 v; v 1];

[L,p]= chol(Cov_mat); %cholesky factorization

n=2000;
R=randn(2,n); %1000 space generator
X=L'*R;
Xs=(cov(X')); %Covariance Matrix of 1000 space vector
Xs1=round(Xs,5);
disp(Xs1);
diff=Cov_mat-Xs;
disp(round(diff,5))