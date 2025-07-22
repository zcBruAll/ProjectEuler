using BenchmarkTools

function pb44()
    found = typemax(Int)

    pentagonNumbers = genPentagon(10_000_000)

    for p in pentagonNumbers
        for q in pentagonNumbers
            d = max(p, q) - min(q, p)
            s = p + q
            if d in pentagonNumbers && s in pentagonNumbers
                found = min(found, d)
            end
        end
    end

    return found
end

function genPentagon(max)
    #return Set([n * (3n - 1) ÷ 2 for n in 1:limit])

    results = Set{Int}()

    n = 1
    while max > n * (3 * n - 1) ÷ 2
        push!(results, n * (3 * n - 1) ÷ 2)
        n += 1
    end

    return results
end

println(pb44())

@btime pb44()