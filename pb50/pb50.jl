using BenchmarkTools

include("../utils/utils.jl")

function pb50(max)
    p = primes(max)
    if max > 952
        pMillion = p
        pLimit = primes(952)
        p = setdiff(pMillion, pLimit)
    end

    resultP = 0
    max = 0

    for i in p
        sum = 0

        offset = 0
        idx = 0
        for j in eachindex(pMillion)
            idx = j
            sum += pMillion[j]

            while sum > i
                offset += 1
                sum -= pMillion[offset]
            end

            if sum == i && (j - offset + 1) > max
                max = j - offset + 1
                resultP = i
            end
        end
    end

    return resultP
end

println(pb50(1_000_000))

#@btime pb50(1_000_000)