using BenchmarkTools, Plots
include("pb05.jl")

times = [
    minimum(@benchmark problem05(20)).time,
    minimum(@benchmark problem05_optimized(20)).time
]

labels = ["Loop", "Optimized"]

bar(labels, times, xlabel="Function", ylabel="Time (ns)", title="Benchmark Comparison", legend=false)
