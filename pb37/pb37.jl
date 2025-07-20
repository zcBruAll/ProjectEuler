include("../utils/utils.jl")

using BenchmarkTools

function problem37()
    resultSet = Set{Int}()

    primesUnder1Mil = primes(1_000_000)
    primeSet = Set(primesUnder1Mil)

    n = 5 # Skip the four first primes (2, 3, 5, 7)
    while length(resultSet) < 11
        nb = primesUnder1Mil[n]

        # isOK = all(p -> p in primeSet, truncate(nb))
        isOK = true
        for p in truncate(nb)
            # if !isPrime(p) can be costly if primesUnder1Mil is a vector
            # Using the following is better with a Set
            if !(p in primeSet)
                isOK = false
                break
            end
        end

        if isOK
            push!(resultSet, nb)
        end

        n += 1
    end

    return sum(resultSet)
end

function truncate(n)
    digN = reverse(digits(n))
    
    resultSet = Set{Int}()

    # push!(resultSet, n) Insert or not the original number
    
    for i in 1:length(digN)
        push!(resultSet, digits_to_number(digN[i:end]))
        push!(resultSet, digits_to_number(digN[1:i]))
    end

    return resultSet
end

println(problem37())

@btime problem37()