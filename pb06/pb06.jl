using BenchmarkTools

function problem06(max)
    sum = 0

    for i in 1:max
        sum += i
    end
    sum = sum^2

    for i in 1:max
        sum -= i^2
    end

    return sum
end

function problem06_optimized(max)
    sum = max * (max + 1) ÷ 2
    sum_sq = (2 * max + 1) * (max + 1) * max ÷ 6
    
    return sum^2 - sum_sq
end

println(problem06(100))
println(problem06_optimized(100))

@btime problem06(100)
@btime problem06_optimized(100)