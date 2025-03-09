using BenchmarkTools

function problem10(target)
    primes = [2]
    candidate = 3
    while candidate < target
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
        candidate += 2
    end
    return sum(primes)
end

function problem10_sieve(target)
    crosslimit = floor(sqrt(target))
    sieve = fill(false, target)
    for n in 4:2:target
        sieve[Int(n)] = true
    end
    for n in 3:2:crosslimit
        if !sieve[Int(n)]
            for m in n^2:2*n:target
                sieve[Int(m)] = true
            end
        end
    end
    sum = 0
    for n in 2:target
        if !sieve[Int(n)]
            sum += n
        end
    end
    return sum
end

function problem10_sieve_optimized(target)
    sievebound = (target - 1) ÷ 2
    sieve = fill(false, sievebound)
    crosslimit = (floor(sqrt(target))-1) ÷ 2
    for i in 1:crosslimit
        if !sieve[Int(i)]
            for j in 2*i*(i+1):2*i+1:sievebound
                sieve[Int(j)] = true
            end
        end
    end

    sum = 2
    for i in 1:sievebound
        if !sieve[Int(i)]
            sum += (2*i+1)
        end
    end

    return sum
end

println(problem10(2_000_000))
println(problem10_sieve(2_000_000))
println(problem10_sieve_optimized(2_000_000))

@btime problem10(2_000_000)
@btime problem10_sieve(2_000_000)
@btime problem10_sieve_optimized(2_000_000)