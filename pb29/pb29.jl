using BenchmarkTools

function pb29(maxa, maxb)
    S = Set{BigInt}()
    for a in 2:maxa
        for b in 2:maxb
            push!(S, BigInt(a)^b)
        end
    end
    return length(S)
end

println(pb29(100, 100))

@btime pb29(100, 100)