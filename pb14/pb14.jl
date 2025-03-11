function problem14(max)
    longest = 0
    best = 0

    for i in 1:max
        step = i
        nb = 0
        while step != 1
            nb += 1
            if step % 2 == 0
                step /= 2
            else
                step = 3 * step + 1
            end
        end
        if nb > best
            best = nb
            longest = i
        end
    end
    return longest
end

# TO IMPROVE
function problem14_optimized(max)
    values = Dict{Int, Int}()
    values[1] = 1

    function getValues(n)

        if haskey(values, n) != 0
            return values[n]
        end

        values[n] = 
            if n % 2 == 0
                1 + getValues(n ÷ 2)
            else
                2 + getValues((3 * n + 1) ÷ 2)
            end

        return values[n]
    end

    best = 1
    longest = 1

    for i in 2:(max ÷ 2)
        chain = getValues(i)
        if chain > best
            best = chain
            longest = i
        end
    end

    return longest
end

println(problem14(1_000_000))
println(problem14_optimized(1_000_000))