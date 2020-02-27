function fourier_example

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First, create a digital time series with a known composition of sine and cosine functions


[fin, Fs] = audioread('C:\Users\jbayl09\Downloads\NorthernCardinal_noise.wav');
f = fin(:,1); % just one channel of stereo
dt = 1/Fs; % sec   time between samples from Fs
nt = length(f); % number of samples in record
T = (nt-1)*dt; % Length of record, fundamental period
t=0:dt:T;  %  time array in seconds (nt points starting at t=0, ending at T, with dT interval)

freq0 = 1/T; % Hz   fundamental frequency (smallest frequency) 

nfmax = floor(nt/2); % number of frequencies resolved by FFT

freq = freq0*(0:nfmax-1); % frequency array
freqmax = freq(nfmax); % maximum frequency resolved by FFT (Nyquist)

disp('Fundemental period and Nyquist Freq')
disp([T, freqmax])

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second take FFT of your function
F = fft(f, nt);


% get the coeffs
a = 2*real(F(1:nfmax))/nt; % form the coefficients
a(1) = a(1)/2;

b = -2*imag(F(1:nfmax))/nt; % form the coefficients

% compute power spectrum
p = sqrt(a.^2 + b.^2);
f_clean = a(1)/2*ones(1,nt); % fill whole array with a0/2
cutoff = 0.4*(max(p));
% add the small number of fourier series elements
for m = 1:nfmax-1
    if p(m+1) > cutoff
    f_clean = f_clean + a(m+1)*cos(m*2*pi*t/T) + b(m+1)*sin(m*2*pi*t/T);
    end
end

sound(f_clean,Fs);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Finally make some plots and see if you get what you expected

figure

subplot(2,1,1)
plot(t,f_clean);
title('Signal');

subplot(2,1,2)
plot(freq/freq0, a, 'o', freq/freq0, b, '*', freq/freq0,p,'-')
legend('Cosine', 'Sine', 'Power', 'Location', 'BestOutside')
xlabel('Multiple of Fundemental Freq')

title('FFT Fourier Coefficients');
xmax = max([f1 f2 f3 f4])/freq0*1.15;
xlim([0 xmax]);
