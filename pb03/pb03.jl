function problem03(n)
    factor = 2
    while n % factor == 0
        n ÷= factor
    end
    
    factor = 3
    while factor * factor <= n
        while n % factor == 0
            n ÷= factor
        end
        factor += 2
    end

    println(idx)
    
    return n > 1 ? n : factor
end

println(problem03(25))
