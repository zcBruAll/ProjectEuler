using BenchmarkTools, Plots
include("pb01.jl")

times = [
    minimum(@benchmark problem01(1_000_000_000)).time,
    minimum(@benchmark problem01_comprehension(1_000_000_000)).time,
    minimum(@benchmark problem01_optimized(1_000_000_000)).time
]

labels = ["Loop", "Comprehension", "Optimized"]

bar(labels, times, xlabel="Function", ylabel="Time (ns)", title="Benchmark Comparison", legend=false)
