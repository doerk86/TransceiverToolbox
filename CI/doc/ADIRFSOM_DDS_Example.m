clear all;

tx = adi.AD9361.Tx;
tx.uri = 'ip:analog'; 
tx.DataSource = 'DDS';
tx.DDSFrequencies = [1e5 1e5; 0 0];
tx.DDSPhases = [90e3 0; 0 0]; % expressed in millidegrees
tx.DDSScales = [1 1; 0 0];
tx();
pause(1);

rx = adi.AD9361.Rx('uri','ip:analog');
y = rx();

tx.release();
rx.release();

figure(1); 
plot(0:numel(y)-1, real(y), 'r', 0:numel(y)-1, imag(y), 'b'); 
xlim([0 250]); 
xlabel('sample index'); 
grid on;