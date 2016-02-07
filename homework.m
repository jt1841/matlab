function homework()

g = 32.174; %ft/s^2
H = 7 + 9; % ft
L = 4; % ft
d = ((1 + 1)/23)/12; %ft
rho = 62.4; % lbm/ft^3

tau = 2; %seconds
t = 0:.01:tau;
[t,V] = ode45(@velocity,t, 0);

% Find V'
V_prime = gradient(V(:,1), t);

%Find force from equation determined earlier
F_H = rho*d^2/4*L*pi*(g*H/L - V.^2/(2*L)) + rho*2*L*(g*H/L - V_prime)*d^2/4*pi;

ax = plotyy(t,V, t, F_H);
xlabel('time (s)', 'FontSize', 18);
ylabel(ax(1),'Velocity (ft/s)', 'FontSize', 18);
set(findall(ax, 'Type', 'Line'),'LineWidth',2);

%FIX ME NARAE
%Figure out the units and make sure all the units I did are correct and
%giving you a reasonable value
ylabel(ax(2),'Force (UNITS)', 'FontSize', 24)

%from the plot the steady state velocity is 32.09 ft/s
% so at 95%. V(t) = 30.4855 ft/s and this happens at aproximatley
% t = 0.456 seconds

%FIX ME NARAE
%Problem 5 you can get from the plot

    function dv = velocity(t,v)
        dv = g*H/L - v^2/(2*L);
    end

end
