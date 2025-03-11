include("../utils/utils.jl")

function problem12(nb_factors)
    p = 3
    div = 2
    count = 0
    p1 = 0
    div1 = 0
    exponent = 0
    max_prime = 1000
    aprimes = primes(max_prime)

    while count <= nb_factors
        p = p + 1
        p1 = p

        if p1 % 2 == 0
            p1 /= 2
        end
        
        div1 = 1

        for i in 1:max_prime + 1
            if aprimes[i]^2 > p1
                div1 *= 2
                break
            end

            exponent = 1
            while p1 % aprimes[i] == 0
                exponent += 1
                p1 /= aprimes[i]
            end

            if exponent > 1
                div1 *= exponent
            end
            if p1 == 1
                break
            end
        end
        count = div * div1
        div = div1
    end

    return p * (p - 1) ÷ 2
end

println(problem12(5))
println(problem12(500))