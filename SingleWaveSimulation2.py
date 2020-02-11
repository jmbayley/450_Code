# Gravitational Wave Research:
#   Modeling a Gravitational wave using Fourier transform
#   =========================================================
#   Jack Bayley and Tim Kostersitz
#   University of Washington Bothell
#   Summer of 2019

import math as M
import cmath as CM
import numpy as np
import matplotlib.pyplot as plt
from scipy import pi
from scipy.fftpack import fft, ifft


def getPn(n, P1):
    return P1 * n ** (-4 / 3)  # magnitude of nth power mode


def getWn(n, T, L):
    return 2 * M.pi * getFn(n, L) * T  # discrete frequency


def getFn(n, L):
    return (2 * n * c) / L  # Physical Frequency


def fillArrayWithIncreasingNums(arr):
    # Helper Function
    for i in range(len(arr)):
        arr[i] = i
    return arr


def getHj(Gu, r, N, J, P1, L, T, c):
    # Returns Cosmic string Signal
    Hj = 0 + 0j
    # Signal of a cosmic String
    for n in range(1, 10):
        Hj = Hj + (((c * M.sqrt(getPn(n, P1))) / (M.pi * getFn(n, L))) * \
            (Gu / (c ** 2) * r) * M.sin((2 * M.pi * J * getWn(n, T, L)) / N))
    
    return Hj

def getFourierTransformSum(k, Gu, r, N, P1, L, T, c):
    # Calcualtes the Fourier Transform of a Gravintational wave caused by a cosmic string
    # Instead of variable j we use variable J, but consider use of different variable in general!
    J = 1
    Hk = 0 + 0j
    for J in range(N):
        Hk = Hk + ((getHj(Gu, r, N, J, P1, L, T, c)) * CM.exp(- 1j * 2 * M.pi * (((J - 1) * (k - 1)) / N)))
    
    return Hk

def calculate_FrequencySpace(fmin, fmax, Gu, r, N, P1, L, T, c, plot):

    k = fmin
    # k is the integer value of the Fourier frequency space aka the wave number (-m)
    # k = 2*Pi/Lambda
    fCount = np.array([k])

    Finitial = (1 / M.sqrt(T)) * getFourierTransformSum(k, Gu, r, N, P1, L, T, c)
    Fs = np.array([Finitial])
    k = k + 1

    for k in range(fmin + 1, fmax):
        temp = (1 / M.sqrt(T)) * getFourierTransformSum(k, Gu, r, N, P1, L, T, c)
        Fs = np.append(Fs, temp)
        fCount = np.append(fCount, k)
    
    if plot == 'Y':
        #multiDomainPlotFromFreq(f, Fs, N)
        plt.plot(fCount, Fs)
        plt.title('Frequency domain Signal')
        plt.xlabel('Frequency Domain number')
        plt.ylabel('Amplitude')
        plt.show()
    return Fs

#==========================================================================
# Wave parameters:
n = 1  # is the mode
N = 20  # maximum number of modes
c = 299792458.0  # speed of light in vacuum
L = 1.0  # length of GW
P1 = 18.0  # magnitude of the first power mode
Gu = 10 ** -10  # Dimensionless String tension
r = 1.0  # Distance from the observer
T = 1 / 31536000  # Integration time

# Main:
fmin = 0
fmax = 100
Ft = calculate_FrequencySpace(fmin, fmax, Gu, r, N, P1, L, T, c, 'Y')
