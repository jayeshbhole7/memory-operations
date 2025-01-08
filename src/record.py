import matplotlib.pyplot as plt

def recordings(coalesced_times, scattered_times):
    threads=[32,64,128,256]
    plt.plot(threads, coalesced_times, label="Coalesced")
    plt.plot(threads, coalesced_times, label="Scattered")
    plt.xlabel("threads")
    plt.ylabel("execution time(ms)")
    plt.legend()
    plt.show()