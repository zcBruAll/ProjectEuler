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

println(problem02(4e6))