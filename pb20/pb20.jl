function problem20(f)
    return sum(digits(factorial(big(f))))
end

println(problem20(100))