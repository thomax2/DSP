from cProfile import label

import MyDspLib
import numpy as np
import math
import matplotlib.pyplot as plt
from math import pi as pi

from matplotlib.pyplot import figure


def lms_adpt(X, D):
    (m, n) = X.shape
    if m < n:
        X = X.T
        m = n
    N = 10
    max_eignvalue = np.abs(np.max(np.linalg.eigvals(X @ X.T)))
    u = 1 / max_eignvalue
    e = np.zeros((1, m - N + 1))
    Y = np.zeros((1, m))
    w = np.zeros((N, 1))
    w[0, 0] = 0.001
    for i in range(N - 1, m):
        Y[0, i] = (X[i - N + 1:i + 1].T @ w)[0, 0]
        e[0, i - N + 1] = D[i, 0] - Y[0, i]
        w = w + 2 * u * e[0, i - N + 1] * X[i - N + 1:i + 1]
    return Y, e


if __name__ == '__main__':

    epoch = 1000
    dt = 0.01
    t = np.arange(0, epoch * dt, dt).reshape((epoch, 1))
    S = np.sin(2 * pi * 10 * t)
    SNR = 10
    X = MyDspLib.awgn(S, SNR)
    D = np.sin(2 * pi * 10 * t)
    [Y,e] = lms_adpt(X, D)

    plt.figure()
    plt.plot(X, label="signal")
    plt.legend()
    plt.show()

    plt.figure()
    plt.plot(Y.T, label="output")
    plt.legend()
    plt.show()
