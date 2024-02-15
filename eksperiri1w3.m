length= 1; % panjang bandul dalam meter
g = 9.8; % percepatan gravitasi
npoints = 250; %diskrit waktu menjadi 250 interval
dt = 0.04; % langkah waktu dalam detik
omega = zeros(npoints,1); % menginisialisasi omega, vektor dimensi npoints X1, menjadi semua nol
theta = zeros(npoints,1); % initializes theta, a vector of dimension npoints X1,to being all zeros
time = zeros(npoints,1); % menginisialisasi theta, vektor dimensi npoints X1, menjadi semua nol
omega(1)=0.0;
theta(1)=0.2; % Anda harus memiliki beberapa perpindahan awal, jika tidak pendulum tidak akan berayun
for step = 1:npoints-1 % mengulang langkah-langkah waktu
omega(step+1) = omega(step) - (g/length)*theta(step)*dt;
theta(step+1) = theta(step)+omega(step)*dt;
time(step+1) = time(step) + dt;
end
plot(time,theta,'r' ); %plot solusi numerik dalam warna merah
xlabel('time (seconds) ');
ylabel('theta (radians)');
