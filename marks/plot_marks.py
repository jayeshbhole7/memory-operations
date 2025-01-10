import os

import pandas as pd
import matplotlib.pyplot as plt



curr_dir = os.path.dirname(os.path.abspath(__file__))
csv_path=os.path.join(curr_dir,"benchmarks.csv")

data = pd.read_csv(csv_path)

plt.figure(figsize=(8,6))
plt.plot(data["Threads"], data["Coalesced"], label="Coalesced")
plt.plot(data["Threads"], data["Scattered"], label="Scattered")
plt.xlabel("Threads")
plt.ylabel("Execution Time (ms)")
plt.title("memory performance pattern")
plt.grid(True)
plt.legend()
plt.show()