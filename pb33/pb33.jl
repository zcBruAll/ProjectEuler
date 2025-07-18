using BenchmarkTools

function pb33()
    num = 1
    den = 1

    for i in 10:99, j in i+1:99
        if i % 10 == 0 && j % 10 == 0
            continue
        end
    
        di = digits(i)
        dj = digits(j)

        common = intersect(di, dj)
        common = filter(x -> x != 0, common)
        if length(common) != 1
            continue
        end
        d = common[1]
    
        rest_i = filter(x -> x != d, di)
        rest_j = filter(x -> x != d, dj)
        if length(rest_i) != 1 || length(rest_j) != 1
            continue
        end
    
        ni, nj = rest_i[1], rest_j[1]
    
        if i * nj == j * ni
            num *= ni
            den *= nj
        end
    end
    

    return den ÷ gcd(num, den)
end

println(pb33())

@btime pb33()