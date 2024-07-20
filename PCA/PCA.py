import numpy as np
import math


def PCA(New_X, k):
    # New_X = np.copy(X)
    m, n = New_X.shape
    u = 0
    for i in range(m):
        for item in New_X[i, :]:
            u += item
        u /= n
        New_X[i, :] -= u
        u = 0.0
    S2, V = np.linalg.eig(np.dot(New_X, New_X.T))
    index_value_S2 = sorted(enumerate(S2), key=lambda x: x[1], reverse=True)
    V_index = []
    for index, value in index_value_S2:
        V_index.append(index)
    V = V[:, V_index]
    P = V[:, 0:k]
    Y = P.T @ New_X
    return Y, P


A = np.array([[1, 0, 2, 5, 3], [2, 0, 4, 7, 8], [3, 2, 7, 8, 9]], dtype=np.float64)
# A = np.array([[1, 0, 2], [5, 3, 2], [0, 4, 7], [8, 3, 2], [7, 8, 9]], dtype=np.float64)
Y, P = PCA(A, 2)
print(Y)
print(P)
