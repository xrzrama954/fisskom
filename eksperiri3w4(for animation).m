g = 9.81; % Acceleration due to gravity in m/s^2
L = 1; % length of the pendulum in meter
b = 0.05; % damping coefficient
m = 1; % mass of the pendulum in kg
t = [0 20]; % time period of the harmonic motion/limits
theta0 = [0 3]; % initial and boundary conditions of angular displacement

% Solving the 2nd order ODE using the function odefun_second_order_pendulum
[t, theta] = ode45(@(t,theta) odefun_second_order_pendulum(t,theta,g,L,b,m), t, theta0);

figure(1)
plot(t, theta(:,1), t, theta(:,2)) % Plotting the angular displacement and angular velocity vs time graph
ylabel('Angular Displacement and Angular Velocity')
xlabel('Time')
legend('Angular Displacement(rad)', 'Angular Velocity(rad/sec)')
% Code for animation of the pendulum
ct=1; % Initialising loop counter
for i=1:length(t)
figure(2)
plot([-1 1],[0 0]); % plotting the wall where the pendulum is fixed
axis([-1.5 1.5 -1.5 1]); % defining the limits of values in the x and y axis
hold on
plot(L*sin(theta(i,1)),-L*cos(theta(i,1)),'o','markersize',20,'markerfacecolor','w'); % plotting
the bobof the pendulum
hold on
plot([0,L*sin(theta(i,1))],[0,-L*cos(theta(i,1))],'b'); % Plotting the string of the pendulum
hold off
M(ct)=getframe(gcf); % stiching all frame in M array to create an animation
ct=ct+1;
end
movie(M)
videofile = VideoWriter('Damped_Pendulum.avi', 'Uncompressed AVI');
open(videofile)
writeVideo(videofile,M)
close(videofile)
