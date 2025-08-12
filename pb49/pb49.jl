using BenchmarkTools

include("../utils/utils.jl")

function pb49()
    p = setdiff(primes(10_000), primes(1_000))
    p = setdiff(p, 1487)

    for l in 1:(length(p)-2)
        digL = digits(p[l])
        for k in (l+1):(length(p)-1)
            digK = digits(p[k])
            sort(digL) != sort(digK) && continue
    
            for m in (k+1):length(p)
                digM = digits(p[m])
                sort(digL) != sort(digM) && continue
    
                if p[m] - p[k] == p[k] - p[l]
                    return (p[l], p[k], p[m])
                end
            end
        end
    end
end

println(pb49())

@btime pb49()