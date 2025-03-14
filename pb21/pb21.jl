include("../utils/utils.jl")

function problem21(max)
    sum = 0

    for a in 2:max
        b = sum_of_divisors(a)
        if b > a
            if sum_of_divisors(b) == a
                sum += a + b
            end
        end
    end

    return sum
end

println(problem21(10000))