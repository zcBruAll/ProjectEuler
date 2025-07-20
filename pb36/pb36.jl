include("../utils/utils.jl")

using BenchmarkTools

function problem36(max)
    result = 0

    for i in 1:2:max
        digDec = digits(i, base=10)
        digBin = digits(i, base=2)
        if digDec == reverse(digDec) && digBin == reverse(digBin)
            result += i
        end
    end

    return result
end

function problem36_optimized(max)
    result = 0
    i = 1
    p = makePalindromeBase2(i, true)
    
    while p < max
        if isPalindrome(p, 10)
            result += p
        end
        i += 1
        p = makePalindromeBase2(i, true)
    end

    i = 1
    p = makePalindromeBase2(i, false)

    while p < max
         if isPalindrome(p, 10)
            result += p
         end
         i += 1
         p = makePalindromeBase2(i, false)
    end

    return result
end

println(problem36(1_000_000))

@btime problem36(1_000_000)

println(problem36_optimized(1_000_000))

@btime problem36_optimized(1_000_000)