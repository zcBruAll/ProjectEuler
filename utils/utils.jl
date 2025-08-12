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

function isPrime(n)
    if n == 1
        return false
    elseif n < 4
        return true
    elseif n % 2 == 0
        return false
    elseif n < 9 
        return true
    elseif n % 3 == 0
        return false
    else
        r = floor(sqrt(n))
        f = 5
        while f <= r
            if n % f == 0
                return false
            end
            if  n % (f + 2) == 0
                return false
            end
            f = f + 6
        end
        return true
    end
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

function f(n)
    if n == 0
        return (0, 1)
    else
        a, b = f(n ÷ 2)
        c = a * (2 * b - a)
        d = a * a + b * b
        if n % 2 == 0
            return (c, d)
        else
            return (d, c + d)
        end
    end
end

function isPalindrome(n, base)
    reversed = 0
    k = n
    while k > 0
        reversed = base * reversed + k % base
        k ÷= base
    end

    return (n == reversed)
end

function makePalindrome(n, base, oddlength)
    res = n
    if oddlength
        n ÷= base
    end

    while n > 0
        res = base * res + n % base
        n ÷= base
    end

    return res
end

function makePalindromeBase2(n, oddlength)
    res = n
    k = n

    if oddlength
        k >>= 1
    end

    while k > 0
        res = (res << 1) | (k & 1)
        k >>= 1
    end

    return res
end

function digits_to_number(digs)
    num = 0
    for d in digs
        num = 10 * num + d
    end
    return num
end

function modpow(base::Int, exp::Int, mod::Int)
    M = BigInt(mod)
    result = BigInt(1)
    b = BigInt(base) % M
    e = exp
    while e > 0
        if e & 1 == 1
            result = (result * b) % M
        end
        b = (b * b) % M
        e >>= 1
    end
    return result
end