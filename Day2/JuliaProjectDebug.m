close all
clear all

%part a
c = -0.8;
d = 0.156;
nMax = 22;

x = zeros(1,nMax);
y = zeros(1,nMax);

x(1) = 0.1;
y(1) = 0.1;
ens = 1:nMax;
for n=2:nMax
    x(n) = x(n-1)^2 - y(n-1)^2 + c;
    y(n) = 2*x(n-1)*y(n-1) + d;
end

%part b
figure;
plot(ens, x,'-ob'); 
ylabel('x(n)')
xlabel('n')
title('exercise b')

%part c
plot(x,y,'ob')
xlabel('x(n)')
ylabel('y(n)')
title('exercise c')

% part d
% In general, you can generate N random numbers 
% in the interval [a,b] with the formula r = a + (b-a).*rand(N,1);
a = -2;
b = 2;
N = 100;
r = a + (b-a).*rand(N,1);

% part e
XStart = a + (b-a).*rand(N,1);
YStart = a + (b-a).*rand(N,1);

figure
plot(XStart,YStart,'ob');
title('exercise e')

%part f/g
kin = 1;
kout = 1;
for i=1:N
    x(1) = XStart(i);
    y(1) = YStart(i);
    for n=2:nMax
        x(n) = x(n-1)^2 - y(n-1)^2 + c;
        y(n) = 2*x(n-1)*y(n-1) + d;
    end
    if abs(x(nMax)) < 2 && abs(y(nMax)) < 2
        Xin(kin) = x(1);
        Yin(kin) = y(1);
        kin = kin + 1;
    else
        Xout(kout) = x(1);
        Yout(kout) = y(1);
        kout = kout + 1;
    end
end

figure
plot(Xin, Yin, '.b')
hold on
plot(Xout, Yout, '.r')
hold off


