function problem15(size)
    return factorial(big(2 * size)) ÷ factorial(big(size)) ^ 2
end

println(problem15(20))