using BenchmarkTools

function pb34()
    result = 0
    
    for i in 10:max_value()
        s = sum(factorial(d) for d in digits(i))
        if s == i
            result += i
        end
    end

    return result 
end

function max_value()
    maxd = factorial(9)

    n = 1
    while n * maxd > 10^n
        n += 1
    end
    n -= 1
    return n * factorial(9)
end

println(pb34())

@btime pb34()