function problem16(temp)
    return sum(digits(2^big(temp)))
end

println(problem16(1_000))