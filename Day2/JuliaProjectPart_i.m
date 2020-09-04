close all
clear all

% part e
a = -2;
b = 2;
c = -0.8
d = 0.156
N = 1e6;
nMax = 22;
XStart = a + (b-a).*rand(N,1);
YStart = a + (b-a).*rand(N,1);
x = zeros(1,N);
y = zeros(1,N);

kin = 1;
kout = 1;
for i=1:N
    x(1) = XStart(i);
    y(1) = YStart(i);
    for n=2:nMax
        x(n) = x(n-1)^2 - y(n-1)^2 + c;
        y(n) = 2*x(n-1)*y(n-1) + d;
        if abs(x(n)) > 2 || abs(y(n)) > 2
                n_at_exit(kout) = n;
                Xout(kout) = x(1);
                Yout(kout) = y(1);
                kout = kout + 1;
                break
        else
                Xin(kin) = x(1);
                Yin(kin) = y(1);
                kin = kin + 1;
        end
    end
end

figure
scatter(Xin, Yin, 10, '.b');
hold on
scatter(Xout, Yout, 10, n_at_exit)
colormap(cool)
