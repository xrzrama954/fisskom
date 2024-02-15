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

