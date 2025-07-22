include("../utils/utils.jl")

using BenchmarkTools
using Combinatorics

function pb43()
    result = 0

    p = primes(17)

    for perm in permutations(0:9)
        if perm[1] == 0
            continue
        end
        
        isOK = true
        for i in 2:8
            if digits_to_number(perm[i:i+2]) % p[i-1] != 0
                isOK = false
                break
            end
        end

        if isOK
            result += digits_to_number(perm)
        end
    end

    return result
end

function pb43_optimized()
    result = 0
    primes = [2, 3, 5, 7, 11, 13, 17]

    for perm in permutations(0:9)
        if perm[1] == 0
            continue
        end

        isOK = true
        for i in 1:7
            num = 100 * perm[i+1] + 10 * perm[i+2] + perm[i+3]
            if num % primes[i] != 0
                isOK = false
                break
            end
        end

        if isOK
            # Convert digits to number manually, efficiently
            num = 0
            for d in perm
                num = 10 * num + d
            end
            result += num
        end
    end

    return result
end

#println(pb43())

#@btime pb43()

println(pb43_optimized())

@btime pb43_optimized()