using BenchmarkTools

function problem01(limit)
    sum = 0
    for i in 1:(limit - 1)
        if i % 3 == 0 || i % 5 == 0
            sum += i
        end
    end
    return sum
end

function problem01_comprehension(limit)
    return sum(i for i in 1:(limit -1) if i % 3 == 0 || i % 5 == 0)
end

function problem01_optimized(limit)
    function sum_divizible_by(k)
        n = div(limit - 1, k)
        return k * n * (n + 1) ÷ 2
    end

    return sum_divizible_by(3) + sum_divizible_by(5) - sum_divizible_by(15)
end

println(problem01(1_000))
println(problem01_comprehension(1_000))
println(problem01_optimized(1_000))

@btime problem01(1_000)
@btime problem01_comprehension(1_000)
@btime problem01_optimized(1_000)