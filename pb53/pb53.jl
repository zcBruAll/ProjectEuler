function fact(n)
    res = BigInt(1)
    for i in 2:n
        res *= i
    end
    return res
end

function pb53()
    result = 0
    for n in 23:100
        is_n_even = (n % 2 == 0)
        
        for r in 1:div(n, 2)
            numerator = fact(n)
            denominator = fact(r) * fact(n - r)
            combination = numerator ÷ denominator 
            
            if combination > 1_000_000
                if is_n_even && r == div(n, 2)
                    result += 1
                else
                    result += 2
                end
            end
        end
    end
    return result
end

function pb53_optimized()
    count = 0
    for n in 23:100
        current_nCr = BigInt(1)
        
        for r in 1:div(n, 2)
            current_nCr = current_nCr * (n - r + 1) ÷ r
            
            if current_nCr > 1_000_000
                count += (n - r) - r + 1
                break
            end
        end
    end
    return count
end

println(pb53())
println(pb53_optimized())
