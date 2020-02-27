function fourier_example

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% First, create a digital time series with a known composition of sine and cosine functions

Fs = 500; % Hz  sampling frequency: samples per second
dT = ?; % sec   time between samples from Fs
nt  = 2000; %     number of samples in record
T = ?; % Length of record, fundamental period
t=?;  %  time array in seconds (nt points starting at t=0, ending at T, with dT interval)

freq0 = 1/T; % Hz   fundamental frequency (smallest frequency) 

nfmax = floor(nt/2); % number of frequencies resolved by FFT

freq = freq0*(0:nfmax-1); % frequency array
freqmax = freq(nfmax); % maximum frequency resolved by FFT (Nyquist)

disp('Fundemental period and Nyquist Freq')
disp([T, freq])

% Create a time series by summing sine and cosine waves

% select four frequencies that are integer multiples of 
%  the fundamental frequency freq0. 
% Use arbitrary multipliers less than about 10.
%   
f1=3*f0;
f2=6*f0;
f3=2*f0;
f4=8*f0;

disp('Frequencies selected:')
disp([f1 f2 f3 f4])

% Create f(t) by summing up four sine or cosine functions at the four frequencies 
% and amplitudes A B C D  below.
% Use your time array defined above so f is an array computed at each element of the
% t array. THIS IS JUST ONE LINE OF CODE!
% Note, this is not a Matlab function.
% f is an array of values corresponding to each of the times t.
% what is the equation for a sine or cos wave with frequency f1?

A = -5;
B = 4;
C = -2;
D = 6;

f =  ?;   %%% FILL IN WITH JUST ONE LINE

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Second take FFT of your function
F = fft(f, nt);

% get the coeffs
a = 2*real(F(1:nfmax))/nt; % form the coefficients
a(1) = a(1)/2;

b = -2*imag(F(1:nfmax))/nt; % form the coefficients

% compute power spectrum
p = sqrt(a.^2 + b.^2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Finally make some plots and see if you get what you expected

figure

subplot(2,1,1)
plot(t,f);
title('Signal');

subplot(2,1,2)
plot(freq, a, 'o', freq, b, '*', freq,p,'-')
legend('Cosine', 'Sine', 'Power', 'Location', 'BestOutside')

title('FFT Fourier Coefficients');
xmax = max([f1 f2 f3 f4])*1.15;
xlim([0 xmax]);