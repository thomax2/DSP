import numpy as np
import math

def awgn(S,SNR):
    P_S = np.mean(S**2)
    P_N = P_S/(10**(SNR/10))
    noise = np.random.normal(size=S.shape)*np.sqrt(P_N)
    Y = noise + S
    return Y