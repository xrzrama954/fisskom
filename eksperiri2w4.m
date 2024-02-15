length= 9.8; %pendulum length in metres
g=9.8; % acceleration due to gravity
q=0.5;
F_Drive=0.5; % damping strength
Omega_D=2/3;
npoints =1500; %Discretize time
dt = 0.04; % time step in seconds
omega = zeros(npoints,1); % initializes omega, a vector of dimension npoints X 1,to being all zeros
theta = zeros(npoints,1); % initializes theta, a vector of dimension npoints X 1,to being all zeros
time = zeros(npoints,1); % this initializes the vector time to being all zeros
theta(1)=0.2; % you need to have some initial displacement, otherwise the pendulum will not swing
omega(1)=0;
for step = 1:npoints-1;
% loop over the timesteps
% Note error in book in Equation for Example 3.3
omega(step+1)=omega(step)+(-(g/length)*sin(theta(step))-
q*omega(step)+F_Drive*sin(Omega_D*time(step)))*dt;
temporary_theta_step_plus_1 = theta(step)+omega(step+1)*dt;
% We need to adjust theta after each iteration so as to keep it between +/-pi
% The pendulum can now swing right around the pivot, corresponding to theta>2*pi.
% Theta is an angular variable so values of theta that differ by 2*pi correspond to the same position.
% For plotting purposes it is nice to keep (-pi<theta<pi).
% So, if theta is <-pi, add 2*pi.If theta is > pi, subtract 2*pi
% If the lines below between the ****** are commented out you get 3.6 (b)% bottom
%********************************************************************************************
if (temporary_theta_step_plus_1 < -pi)
temporary_theta_step_plus_1= temporary_theta_step_plus_1+2*pi;
elseif (temporary_theta_step_plus_1 > pi)
temporary_theta_step_plus_1= temporary_theta_step_plus_1-2*pi;
end;
%********************************************************************************************
% Update theta array
theta(step+1)=temporary_theta_step_plus_1;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% In the Euler method, , the previous value of omega
% and the previous value of theta are used to calculate the new values of omega and theta.
% In the Euler Cromer method, the previous value of omega
% and the previous value of theta are used to calculate the the new value
% of omega. However, the NEW value of omega is used to calculate the new
% theta
%
time(step+1) = time(step) + dt;
end;
plot(time,theta,'r' ); %plots the numerical solution in red
xlabel('time (seconds) ');
ylabel('theta (radians)');
%plot (theta,omega,'r' ); %plots the numerical solution
%xlabel('theta (radians)');
%ylabel('omega (seconds)');
