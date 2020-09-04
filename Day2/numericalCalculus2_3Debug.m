% ------------------------------------------------------
A     = 1.1; % fluorescence intensity units
omega = 2.6; % rad/s
A_0   = 0.01;

u=@(t) A*sin(omega*t)+A_0;

tArray = linspace(0,1.6,200);
uArray = u(tArray); % an array of samples of u
% ------------------------------------------------------

% analytical solutions (in real life, we might not know these)
dudtExact      =  A*omega*cos(omega*tArray);
du2dt2Exact    = -A*omega^2*sin(omega*tArray);
du3dt3Exact    = -A*omega^3*cos(omega*tArray);

%loop through noise size to detemine where 10% cutoff is
%give a variable name "z" to constant
%display(uObserved);

%figure;
%plot(tArray,uObserved, '+')
z = 1e-7;
uObserved = u(tArray) + z*randn(size(tArray));

%part 1
dudt = diff(uObserved)./diff(tArray);
du2dt2 = diff(dudt)./diff(tArray(1:end-1));
du3dt3 = diff(du2dt2)./diff(tArray(1:end-2));

plot(tArray(1:end-1), dudt)
q = linspace(0,0.001,100)
for i=1:100
    z = q(i);
    uObserved = u(tArray) + z*randn(size(tArray));
    dudt = diff(uObserved)./diff(tArray);
    du2dt2 = diff(dudt)./diff(tArray(1:end-1));
    du3dt3 = diff(du2dt2)./diff(tArray(1:end-2));
    diff1 = (dudt - dudtExact(1:end-1))./dudtExact(1:end-1);
    diff2 = (du2dt2 - du2dt2Exact(1:end-2))./du2dt2Exact(1:end-2);
    diff3 = (du3dt3 - du3dt3Exact(1:end-3))./du3dt3Exact(1:end-3);
        if max(abs(diff1))>0.1 || max(abs(diff2))>0.1 || max(abs(diff3))>0.1
                display(z)
                break
        end
end