using BenchmarkTools

function problem07(target)
    primes = Int[]
    candidate = 2
    while length(primes) < target
        isprime = true
        for p in primes
            if p * p > candidate
                break
            end
            if candidate % p == 0
                isprime = false
                break
            end
        end
        if isprime
            push!(primes, candidate)
        end
        if candidate % 2 == 0
            candidate += 1
        else
            candidate += 2
        end
    end
    return primes[end]
end

function isPrime(n)
    if n == 1
        return false
    elseif n < 4
        return true
    elseif n % 2 == 0
        return false
    elseif n < 9 
        return true
    elseif n % 3 == 0
        return false
    else
        r = floor(sqrt(n))
        f = 5
        while f <= r
            if n % f == 0
                return false
            end
            if  n % (f + 2) == 0
                return false
            end
            f = f + 6
        end
        return true
    end
end

function problem07_optimized(target)
    count = 1
    candidate = 1
    while count != target
        candidate += 2
        if isPrime(candidate)
            count += 1
        end
    end
    return candidate
end

println(problem07(10_001))
println(problem07_optimized(10_001))

@btime problem07(10_001)
@btime problem07_optimized(10_001)