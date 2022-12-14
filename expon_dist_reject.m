clc, clear

a=-4;
b=4;
ymax=0.4;
q=0;
for p=1:100
  
    u1=rand(1,1);
    u2=rand(1,1);
    x1=a+u1*(b-a);
    y1=ymax*u2;
    f=2*exp(-2*x1);
    
    while 1 && q<20
        if y1<=f
            
            x=x1;
            scatter(x,f);
            hold on;
        end
        q=q+1;
    end
    q=0;
end
grid on;