function problem25(target)
    f1 = BigInt(1)
    f2 = BigInt(1)

    index = 2

    while length(digits(f1)) < target
        temp = f1 + f2
        f2 = f1
        f1 = temp
        index += 1
    end

    return index
end

function problem25_optimized(target)
    phi = (1 + sqrt(5)) / 2
    return ceil(((target - 1) + log10(sqrt(5))) / log10(phi))
end

# println(problem25(1_000))
println(problem25_optimized(1_000))