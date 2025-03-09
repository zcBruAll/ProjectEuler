function problem02(limit)
    sum = 0
    term1 = 0
    term2 = 1
    while term1 + term2 < limit
        temp = term1 + term2
        if temp % 2 == 0
            sum += temp
        end
        term1 = term2
        term2 = temp
    end
    sum
end

function problem02_optimized(limit)
    sum = 0
    term1 = 2
    term2 = 8
    while term1 < limit
        sum += term1
        term1, term2 = term2, 4 * term2 + term1
    end
    return sum
end

println(problem02_optimized(4e6))