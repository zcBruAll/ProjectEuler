using BenchmarkTools

include("../utils/utils.jl")

function pb46()
    p = primes(1_000_000)
    setp = Set(p)

    for i in 9:2:1_000_000
        if i in setp
            continue
        end

        isOk = false
        for j in p
            if j > i - 2
                break
            end

            k = (i - j) / 2
            if sqrt(k) == floor(sqrt(k))
                isOk = true
                break
            end
        end
        if !isOk
            return i
        end
    end
end

println(pb46())

@btime pb46()