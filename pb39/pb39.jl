using BenchmarkTools

function pb39(max)
    counts = zeros(Int, max + 1)

    for m in 2:(max ÷ 2)
        for n in 1:m
            if (m - n) % 2 == 1 && gcd(m, n) == 1
                p = 2 * m * (m + n)
                k = 1
                while k * p < max
                    counts[k * p] += 1
                    k += 1
                end
            end
        end
    end

    return findmax(counts)
end

println(pb39(1_000))

@btime pb39(1_000)