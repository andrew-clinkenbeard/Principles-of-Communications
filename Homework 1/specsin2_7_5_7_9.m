% specsin2.m: spectrum of a sine wave via the FFT/DFT
freq= [ 100, 200, 300, 450, 550, 600, 800, 2200];
ts_test = [1/1000, 1/500, 1/250, 1/50];
n_tests  = [2^11, 2^14, 2^8, 2^4, 2^2, 2^20];
phi = [0, 0.2, 0.4, 0.8, 1.5, 3.14];
f=100; Ts=1/1000; time=10000.0;               % freq, sampling interval, time
t=Ts:Ts:time;                              % define a time vector
%w=sin(2*pi*f*t);                           % define the sinusoid
%w=sin(2*pi*f*t).^10;
%w=sinc(2*pi*f*t).^2;
%w = sin(t) + i * exp(-t);
w=sin(2*pi*f*t + phi(6)).^2;
N=2^10;                                    % size of analysis window
ssf=(-N/2:N/2-1)/(Ts*N);                   % frequency vector
fw=fft(w(1:N));                            % do DFT/FFT
fws=fftshift(fw);                          % shift it for plotting
figure(1), plot(t(1:N),w(1:N))             % plot the waveform
xlabel('seconds'); ylabel('amplitude')     % label the axes
figure(2), plot(ssf,abs(fws))              % plot magnitude spectrum
xlabel('frequency'); ylabel('magnitude')   % label the axes

