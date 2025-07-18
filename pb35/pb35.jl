include("../utils/utils.jl")

using BenchmarkTools

function pb35(max)
    allprimes = primes(max)
    r = 0

    for p in allprimes
        dp = reverse!(digits(p))
        if length(dp) == 1
            r += 1
            continue
        end

        nb = p
        isok = true
        for i in 1:length(dp)            
            u = nb % 10
            f = nb ÷ 10
            nb = u * 10^(length(dp) - 1) + f

            if nb ∉ allprimes
                isok = false
                break
            end
        end
        if isok
            r += 1
        end
    end

    return r
end

println(pb35(1_000_000))

@btime pb35(1_000_000)