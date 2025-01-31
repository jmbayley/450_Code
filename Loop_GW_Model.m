% Gravitational Wave Research:
%   Modeling a Gravitational wave using Fourier transform
%   =========================================================
%   Jack Bayley and Tim Kostersitz
%   University of Washington Bothell
%   Summer of 2019
function Loop_GW_Model
%Top Level Function

global n N c L P1 Gu r T fmin fmax nums_array
% Wave parameters:
n = 1;  % is the mode
N = 20;  % maximum number of modes
c = 299792458.0;  % speed of light in vacuum
L = 1.0;  % length of GW
P1 = 18.0;  % magnitude of the first power mode
Gu = 10e-10;  % Dimensionless String tension
r = 1.0;  % Distance from the observer
T = 1/31536000;  % Integration time
fmin = 0;
fmax = 100;
nums_array = zeros();


Ft = calculate_FrequencySpace(fmin, fmax, Gu, r, N, P1, L, T, c, 'Y');
disp(Ft)
fillArrayWithIncreasingNums(100);
disp(nums_array)
end %top-level function end



function pn = getPn(n, P1)
global n P1 
    pn = P1.*n^(-4 / 3);  % magnitude of nth power mode
end %function end

function omega_n = getWn(n, T, L)
global n L T 
    omega_n = 2.*pi.*getFn(n, L).*T;  % discrete frequency
end %function end
 
function F_n = getFn(n, L)
global n c L 
    F_n = (2.*n.*c)./L;  % Physical Frequency
end %function end

function fillArrayWithIncreasingNums(arr)
    % Helper Function
    global n N c L Pl Gu r T fmin fmax nums_array
    for i = range(length(arr))
        nums_array(i) = i;
    end %for end
end %function end


function GW_signal = getHj(Gu, r, N, J, P1, L, T, c)
% Returns Cosmic string Signal
global n N c L Pl Gu r T fmin fmax
GW_signal = 0 + 0j;
% Signal of a cosmic String
    for n = range(1, 10)
        GW_signal = GW_signal + (((c.*sqrt(getPn(n, P1)))./(pi.*getFn(n, L))).*(Gu / ((c.^2).*r)).*sin((2.*pi.*J.*getWn(n, T, L))./N));
    end %for end
end %function end
    
function fourier = getFourierTransformSum(k, Gu, r, N, P1, L, T, c)
% Calcualtes the Fourier Transform of a Gravitational wave caused by a cosmic string
% Instead of variable j we use variable J, but consider use of different variable in general!
global n N c L Pl Gu r T fmin fmax
J = 1;
fourier = 0 + 0j;
    for J = range(N)
        fourier = fourier + ((getHj(Gu, r, N, J, P1, L, T, c)) .*exp(- 1j .* 2 .* pi .* (((J - 1) .* (k - 1)) ./ N)));
    end %for end
end %function end
    

function freq_space = calculate_FrequencySpace(fmin, fmax, Gu, r, N, P1, L, T, c, plot)
global n N c L Pl Gu r T fmin fmax
k = fmin;
% k is the integer value of the Fourier frequency space aka the wave number (-m)
% k = 2*Pi/Lambda
k = k + 1;
fCount = zeros(k);

Finitial = (1 ./sqrt(T)) .* getFourierTransformSum(k, Gu, r, N, P1, L, T, c);
freq_space = (Finitial);


    for k = range(fmin + 1, fmax)
        temp = (1./sqrt(T)).* getFourierTransformSum(k, Gu, r, N, P1, L, T, c);
        freq_space = [freq_space(k), temp(k)];
        fCount = [fCount(k), k];
    
    if plot == 'Y'
        %multiDomainPlotFromFreq(f, Fs, N)
        hold on
        plot(fCount, freq_space)
        title('Frequency domain Signal')
        xlabel('Frequency Domain number')
        ylabel('Amplitude')
    end %if end
    end %for end
end %function end

