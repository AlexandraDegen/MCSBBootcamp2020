% define ODE and parameters
a_0 = 500; % molecules per hour
a_1 = 0.5; % molecules per hour, per existing molecule of A
b = 4; % 1/hrs
dPdt =@(P) (a_0 + a_1*P) - b*P;

% Find the steady state by plotting the dP/dt versus P
PArray = linspace(0,200,200);
dPdtPhaseLine = dPdt(PArray);
figure;
plot(PArray,dPdtPhaseLine,'r');
ylabel('dP/dt');
xlabel('P');
refline(0,0); % horizontal line at dPdt=0
legend('dP/dt Phase Line','reference line');

%solve steady state with ode45

[T, P] = ode45(@(t,x)dPdt(x), [0,5.0], 0); % Matlab's built-in ODE solver, ode45

plot(T,P)
ylabel('Molecules of protein A');
xlabel('Time (hours)');