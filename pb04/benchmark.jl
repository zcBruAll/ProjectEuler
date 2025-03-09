using BenchmarkTools, Plots

times = [
    minimum(@benchmark problem04(3)).time,
    minimum(@benchmark problem04_optimized(3)).time
]

labels = ["Loop", "Optimized"]

bar(labels, times, xlabel="Function", ylabel="Time (ns)", title="Benchmark Comparison", legend=false)
