function problem24(numbers, target)
    numbers = sort(numbers)

    target -= 1
    result = []
    available = copy(numbers)

    for i in length(numbers)-1:-1:0
        f = factorial(i)
        index = target ÷ f + 1
        push!(result, available[index])
        deleteat!(available, index)
        target %= f
    end

    return result
end

println(problem24([0, 1, 2, 3, 4, 5, 6, 7, 8, 9], 1_000_000))