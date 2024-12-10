using BenchmarkTools, Plots

times = [
    minimum(@benchmark problem01(1000)).time,
    minimum(@benchmark problem01_comprehension(1000)).time,
    minimum(@benchmark problem01_optimized(1000)).time
]

labels = ["Loop", "Comprehension", "Optimized"]

bar(labels, times, xlabel="Function", ylabel="Time (ns)", title="Benchmark Comparison", legend=false)
