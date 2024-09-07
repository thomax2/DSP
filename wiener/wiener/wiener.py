import numpy as np
import math
import MyDspLib
import matplotlib.pyplot as plt
from math import pi as pi

L = 1000
fs = 10 ** 5
dt = 1 / fs
t = np.arange(0, (L) * dt, dt)
S = np.sin(1000 * pi * t) + 1.5 * np.sin(2000 * pi * t)
SNR = 10
X = MyDspLib.awgn(S, SNR)

e = X - S
N = math.floor(L * 0.1)

oRxx=(np.correlate(X,X,"full"))/L
Rxx = oRxx[L-N:L+N-1]
Rxxt = np.zeros((N,N))
for i in range(N):
    for j in range(N):
        Rxxt[i,j] = Rxx[N-1-i+j]

orSS = (np.correlate(S,S,"full"))/L
rSS = orSS[L-N:L+N-1]
rSSt = np.zeros((1,N))
for i in range(N):
    rSSt[0,i] = rSS[i]

h = (np.linalg.inv(Rxxt))@rSSt.T

Y = np.convolve(X,h[:,0],"full")


plt.figure(num=1, figsize=(6, 6))
plt.plot(t, X)
plt.show()

plt.figure(num=2, figsize=(6, 6))
plt.plot(Y)
plt.show()
