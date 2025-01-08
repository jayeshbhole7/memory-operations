import pandas as pd

import matplotlib.pyplot as plt

data = pd.read_csv("benchmarks.csv")
plt.plot(data["Threads"], data["Coalesced"], label="Coalesced")
plt.plot(data["Threads"], data["Scattered"], label="Scattered")
plt.xlabel("Threads")
plt.ylabel("Execution Time (ms)")
plt.legend()
plt.show()