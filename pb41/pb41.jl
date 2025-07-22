include("../utils/utils.jl")

using BenchmarkTools

function pb40()
    # Why at most 7 digits ?
    # If 1 to 9 pan. : Sum of digits is 45 -> Divisible by 3
    # If 1 to 8 pan. : Sum of digits is 36 -> Divisible by 3
    # If 1 to 7 pan. : Sum of digits is 28 -> Not divisible by 3
    # Limit is then the largest 7-digit pandigital number
    primeVec = primes(7_654_321)
    largest = 2

    for p in primeVec
        dig = digits(p)
        if sort(dig) == collect(1:length(dig))
            largest = p
        end
    end

    return largest
end

println(pb40())

@btime pb40()