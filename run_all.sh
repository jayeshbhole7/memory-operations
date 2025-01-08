echo "cuda code running"
nvcc src/main.cu -o src/main && ./src/main

echo "cpuCode running"
g++ src/cpu.cpp -o src/cpu && ./src/cpu

echo "cacheCode running"
python src/GpuCache.py

echo "recording_performance"
python src/record.py

echo "running marks"
python marks/plot_marks.py

echo "running tests"
python tests/cache.py
nvcc tests/memory.cu -o tests/memory && ./tests/memory

echo "running client"
python it/main.py