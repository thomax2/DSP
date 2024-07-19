import numpy
import numpy as np
import math


def SVD(A):
    f_t = 0
    m, n = A.shape
    # print(shape)
    if m < n:
        A = A.T
        f_t = 1
        m, n = A.shape
    S2, V = np.linalg.eig(np.dot(A.T, A))
    # print(V)
    for i in range(S2.size):
        S2[i] = math.sqrt(S2[i])
    index_value_S2 = sorted(enumerate(S2), key=lambda x: x[1], reverse=True)
    V_index = []
    S_value = []
    for index, value in index_value_S2:
        V_index.append(index)
        S_value.append(value)
    V = V[:, V_index]
    U = np.dot(A, V)

    zeros_matrix = np.zeros((m, m - n))
    U = np.c_[U, zeros_matrix]
    for index, value in enumerate(S_value):
        if value != 0:
            U[:, index] = U[:, index] / value
    S = np.diag(S_value)
    zeros_matrix = np.zeros((m-n, n))
    S = np.r_[S, zeros_matrix]
    # print(V_index)
    # print(S_value)
    # print(S)
    # # print(S2)
    # print(V)
    # print(U)
    print(U @ S @ V.T)
    return 0


A = np.array([[1, 0, 2], [2, 0, 4]])
matrix_normal = np.random.randn(5, 6)
print(matrix_normal)

SVD(matrix_normal)
