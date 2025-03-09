using BenchmarkTools

function problem09(target)
    for c in target:-1:3
        for b in target-c:-1:2
            a = target-c-b

            if a >= b || b >= c
                continue
            end
            
            if a+b+c != target || a^2 + b^2 != c^2
                continue
            end
            return a*b*c
        end
    end
end

function problem09_optimized(target)
    s2 =  target ÷ 2
    mlimit = ceil(sqrt(s2)) - 1
    for m in 2:mlimit
        if s2 % m == 0
            sm = s2 ÷ m
            while sm % 2 == 0
                sm = sm ÷ 2
            end
            if m % 2 == 2
                k = m+2
            else
                k = m+1
            end
            while k < 2*m && k <= sm
                if sm % k == 0 && gcd(Int(k), Int(m)) == 1
                    d = s2 ÷ (k*m)
                    n = k-m
                    a = d*(m^2-n^2)
                    b = 2*d*m*n
                    c = d*(m^2+n^2)
                    return a*b*c
                end
                k = k+2
            end
        end
    end     
end

println(problem09(1_000))
println(Int(problem09_optimized(1_000)))

@btime problem09(1_000)
@btime problem09_optimized(1_000)