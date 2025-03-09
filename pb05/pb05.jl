include("../utils/utils.jl")

function problem05(max)
    lcm = Dict{Int64, Dict{Int64, Int64}}()
    
    for i in 2:max
        lcm[i] = Dict{Int64, Int64}()
        
        n = i
        factor = 2
        
        while n % factor == 0
            lcm[i][factor] = get(lcm[i], factor, 0) + 1
            n ÷= factor
        end
        
        factor = 3
        while factor <= n
            while n % factor == 0
                lcm[i][factor] = get(lcm[i], factor, 0) + 1
                n ÷= factor
            end
            factor += 2
        end
    end
    
    pf = Dict{Int64, Int64}()
    for i in keys(lcm)
        for j in keys(lcm[i])
            if get(pf, j, 0) < lcm[i][j]
                pf[j] = lcm[i][j]
            end
        end
    end
    
    sum = 1
    for i in keys(pf)
        sum *= i ^ pf[i]
    end

    return sum
end

function problem05_optimized(k)
    if k < 2
        return 1
    end

    sqrt_k = sqrt(k)
    primes_under_k = primes(k)
    lcm = 1

    for p in primes_under_k
        if p > sqrt_k
            lcm *= p
        else
            max_exp = floor(Int, log(k) / log(p))
            lcm *= p^max_exp
        end
    end

    return lcm
end

println(problem05_optimized(20))