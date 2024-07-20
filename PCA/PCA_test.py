import matplotlib.pyplot as plt
import numpy as np
import PCA

# product data
np.random.seed(0)
data = np.random.randn(2, 100)
Y, P = PCA.PCA(data, 2)
# plot data
plt.figure(num=1, figsize=(6, 6))
size = 10
plt.xlim([-size, size])
plt.ylim([-size, size])
plt.plot([-size, size], [0, 0], label='x-axis', color='black')
plt.plot([0, 0], [-size, size], label='y-axis', color='black')
plt.scatter(data[0, :], data[1, :], label='origin_data')
plt.arrow(0, 0, P[0, 0] * 10, P[1, 0] * 10, color='red', label='PCA_vector')
plt.arrow(0, 0, P[0, 1] * 10, P[1, 1] * 10, color='green', label='PCA_vector')
plt.legend(loc='best')
plt.show()
