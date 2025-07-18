using BenchmarkTools

function pb32()
    products = Set{Int}()

    for a in 1:9, b in 1000:9999
        p = a * b
        if length(digits(a)) + length(digits(b)) + length(digits(p)) != 9
            continue
        end
        
        v = sort!(vcat(digits(a), digits(b), digits(p)))
        if v == collect(1:9)
            push!(products, p)
        end
    end

    for a in 10:99, b in 100:999
        p = a * b
        if length(digits(a)) + length(digits(b)) + length(digits(p)) != 9
            continue
        end
        v = sort!(vcat(digits(a), digits(b), digits(p)))
        if v == collect(1:9)
            push!(products, p)
        end
    end

    return sum(products)
end

println(pb32())

@btime pb32()