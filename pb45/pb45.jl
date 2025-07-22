using BenchmarkTools

function pb45()
    # Start at n = 144 to directly get the next triangle, pentagonal and hexagonal number
    n = 144
    while true
        # Only compute for hexagonal numbers, since it grows faster (have "less" numbers)
        x = n * (2 * n - 1)
        # No need to check for triangle numbers:
        # hexagonal numbers are already triangles numbers
        if isPentagonal(x) # && isTriangle(x)
            return x
        end
        n += 1
    end
end

function isTriangle(x)
    n = (-1 + sqrt(1 + 8 * x)) / 2
    return n == floor(n)
end

function isPentagonal(x)
    n = (1 + sqrt(24 * x + 1)) / 6
    return n == floor(n)
end

println(pb45())

@btime pb45()