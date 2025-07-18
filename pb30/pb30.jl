using BenchmarkTools

function max_value(p)
    n = 1
    while n * 9^p >= 10^(n-1)
        n += 1
    end
    
    n -= 1  # Counter overstep
    return n * 9^p
end

function pb30(power)
    r = 0

    for c in 10:max_value(power)
        # arr = reverse!((digits!([9,9,9,9,9,9], c)))
        # tempres = 0
        # for d in arr
        #     tempres += d^power
        # end
        s = sum(d^power for d in digits(c))
        if s == c
            r += c
        end
    end

    return r
end

println(pb30(5))

@btime pb30(5)