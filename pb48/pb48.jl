using BenchmarkTools

include("../utils/utils.jl")

function pb48(max::Int)
    M = 10^10
    s = 0
    
    for a in 1:max
        s = (s + modpow(a, a, M)) % M
    end

    return lpad(string(s), 10, '0')
end

println(pb48(1000))

@btime pb48(1_000)