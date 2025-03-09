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