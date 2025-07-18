include("../utils/utils.jl")

using BenchmarkTools

function pb27(maxa, maxb)
    ra = 1
    rb = 41
    nbn = 39

    for a in -maxa:maxa
        if a % 2 == 0
            continue
        end
        for b in primes(maxb)
            n = 0
            while n^2 + a*n + b > 0 && isPrime(n^2 + a*n + b)
                n += 1
            end
            if (n > nbn)
                ra = a
                rb = b
                nbn = n
            end
        end
    end

    return (ra, rb, nbn, ra * rb)
end

println(pb27(1_000, 1_000))

@btime pb27(1_000, 1_000)