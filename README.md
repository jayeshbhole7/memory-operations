## memory operations

This project demonstrates GPU and CPU memory operations, caching behavior, and basic performance comparisons. It includes CUDA kernels, Python scripts for plotting and recording benchmarks.

## Features

- CUDA kernels for GPU memory read/write.
- CPU equivalent operations.
- Simple unit tests.
- Benchmark plots using Matplotlib and Pandas.
- Simple memory operations and basic cache(LRU) simulation.

## Installation

1. Install Python dependencies:
   ```bash
   pip install -r requirements.txt
   ```
2. Ensure you have CUDA Toolkit and a C++ compiler installed.

## Usage

1. Run `run_all.sh` :
   - Compile and run the CUDA code.
   - Compile and run the CPU code.
   - Execute Python scripts for caching, recording, and plotting.
   - Run unit tests.

## References

- [NVIDIA CUDA C Programming Guide](https://docs.nvidia.com/cuda/cuda-c-programming-guide/index.html)

## Notes

- Visualization is restricted to pre-defined datasets.
