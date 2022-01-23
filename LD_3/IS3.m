x=[0.1:1/22:1];
d=(1+0.6*sin(2*pi*x/0.7)+0.3*sin(2*pi*x))/2;

plot(x,d); grid

c1=0.2;
r1=0.2;
c2=0.55;
r2=0.2;

w1=randn(1)*0.1;
w2=randn(1)*0.1;

b=randn(1)*0.1;

for index = 1:100
    ones(82)*0.1;
    ones(91)*0.15;
for x_index=1:20
   
phi1=exp(-(x(x_index)-c1)^2/(2*r1)^2);
phi2=exp(-(x(x_index)-c2)^2/(2*r2)^2);

y=phi1*w1+phi2*w2+b;
e=d(x_index)-y;

n=0.1;

w1= w1+n*e*phi1;
w2 = w2+n*e*phi2;
b=b+n*e;

v1(x_index) = phi1*w1+phi2*w2+b;
end

end

plot(x,d, x,v1,'*'); grid