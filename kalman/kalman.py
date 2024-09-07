import MyDspLib
import numpy as np
import math
import matplotlib.pyplot as plt
from math import pi as pi

epoch = 200
dt = 0.01
accelrate = 0
velocity = 1
position = 0

F = np.array([
    [1, dt, dt ** 2],
    [0, 1, dt],
    [0, 0, 1]
]).reshape((3, 3))

H = np.array([1, 0, 0]).reshape((1, 3))
P = np.array([
    [0.5, 0, 0],
    [0, 0.1, 0],
    [0, 0, 0]
]).reshape((3, 3))
Q = 1

state = np.zeros((3, epoch))
obser = np.zeros((1, epoch))

X = np.zeros((3, epoch))
Xa = np.zeros((3, epoch))
Xa[:, 0] = [0, 0, 0]

R = np.eye(3)
Ra = np.eye(3)

state[0, 0] = position
state[1, 0] = velocity
state[2, 0] = accelrate

obser[0, 0] = position + np.sqrt(Q) * np.random.normal(0, 1)

for i in range(1, epoch):
    state[:, i] = F @ state[:, i - 1]
    state[0, i] = state[0, i] + np.sqrt(P[0, 0]) * np.random.normal(0, 1)
    state[1, i] = state[1, i] + np.sqrt(P[1, 1]) * np.random.normal(0, 1)
    state[2, i] = state[2, i] + np.sqrt(P[2, 2]) * np.random.normal(0, 1)
    obser[0, i] = (H @ state[:, i - 1])[0] + np.sqrt(Q) * np.random.normal(0, 1)
# H @ state[:, i - 1] make "DeprecationWarning: Conversion of an array with ndim > 0 to a scalar is deprecated"

for i in range(1, epoch):
    Xa[:, i] = F @ X[:, i - 1]
    Ra = F @ R @ F.T + P
    G = (Ra @ H.T) @ (np.linalg.inv((H @ Ra @ H.T + Q)))
    X[:, i] = X[:, i - 1] + np.array(G @ np.asmatrix(obser[0, i] - H @ Xa[:, i]))[:, 0]
    R = (np.eye(3) - G @ H) @ Ra

plt.figure()
plt.plot(state[0, :], label='real')
plt.plot(obser[0, :], label='observed')
plt.plot(X[0, :], label='predicted')
plt.legend()
plt.show()
