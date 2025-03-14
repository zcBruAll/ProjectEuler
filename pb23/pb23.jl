include("../utils/utils.jl")

function problem23()
    result = sum(i for i in 1:11)

    abundants = [12]

    for i in 12:28123
        if i < sum_of_divisors(i)
            push!(abundants, i)
        end

        canAdd = true
        for m in abundants, n in abundants
            if m + n == i
                canAdd = false
                break
            end
        end

        if canAdd
            result += i
        end
    end

    return result
end

function problem23_optimized()
    limit = 28123
    div_sum = zeros(Int, limit)
    
    for i in 1:(limit ÷ 2)
        for j in (2*i):i:limit
            div_sum[j] += i
        end
    end

    abundant = [n for n in 12:limit if div_sum[n] > n]

    can_be_written = falses(limit)
    for i in eachindex(abundant)
        for j in i:length(abundant)
            s = abundant[i] + abundant[j]
            if s <= limit
                can_be_written[s] = true
            else
                break
            end
        end
    end

    return sum(n for n in 1:limit if !can_be_written[n])
end

println(problem23())
println(problem23_optimized())