using BenchmarkTools, Plots
include("pb02.jl")

times = [
    minimum(@benchmark problem02(4e6)).time,
    minimum(@benchmark problem02_optimized(4e6)).time
]

labels = ["Loop", "Optimized"]

bar(labels, times, xlabel="Function", ylabel="Time (ns)", title="Benchmark Comparison", legend=false)
