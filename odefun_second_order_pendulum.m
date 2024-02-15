function [thetadot] = odefun_second_order_pendulum(t,theta,g,L,b,m)
thetadot = zeros(2,1);
thetadot(1)= theta(2);
thetadot(2)= ((-b/m)*theta(2)) - ((g/L)*sin(theta(1)));
end
