function primes(max)
    if max < 2
        return Int[]
    elseif max == 2
        return [2]
    end

    sieve = trues(div(max - 1, 2))
    for i in 1:floor(Int, (sqrt(max) - 1) / 2)
        if sieve[i]
            p = 2 * i + 1
            for j in ((p^2 - 1) ÷ 2):p:div(max - 1, 2)
                sieve[j] = false
            end
        end
    end

    return [2; 2 .* findall(sieve) .+ 1]
end

function sum_of_divisors(value)
    n = value
    sum = 1
    p = 2
    while p^2 <= n && n > 1
        if n % p == 0
            j = p^2
            n ÷= p
            while n % p == 0
                j *= p
                n ÷= p
            end
            sum *= (j - 1)
            sum ÷= (p - 1)
        end
        if p == 2
            p = 3
        else
            p += 2
        end
    end
    if n > 1
        sum *= (n + 1)
    end
    return sum - value
end