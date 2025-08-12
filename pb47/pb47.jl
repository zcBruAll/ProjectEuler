using BenchmarkTools

include("../utils/utils.jl")

function pb47(nb)
    idx = 0
    j = 1

    while idx != nb
        if count_distinct__pfactors(j) == nb
            idx += 1
        else 
            idx = 0
        end

        j += 1
    end

    return (j - 1) - (nb - 1)
end

function count_distinct__pfactors(n)
    nb = 0

    p = primes(Int(floor(sqrt(n))))

    for i in p
        if n % i == 0
            nb += 1

            while n % i == 0
                n ÷= i
            end
        end
    end

    if n > 1
        nb += 1
    end

    return nb
end

println(pb47(4))

@btime pb47(4)