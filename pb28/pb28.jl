using BenchmarkTools

function pb28(size)
    maxlayer = size ÷ 2

    result = 1
    last = 1
    for i in 1:maxlayer
        for a in 1:4
            last += 2 * i
            result += last
        end
    end

    return result
end

function pb28_optimized(size)
    # for each square of n by n with n odd:
    # top right corner = n^2
    # top left corner = n^2 - n + 1
    # bottom left corner = n^2 - 2n + 2
    # bottom right corner = n^2 - 3n + 3
    # sum of all corner = 4n^2 - 6n + 6

    result = 1
    for n in 3:2:size
        result += 4n^2 - 6n + 6
    end
    return result
end

println(pb28(1001))

@btime pb28(1001)

println(pb28_optimized(1001))

@btime pb28_optimized(1001)