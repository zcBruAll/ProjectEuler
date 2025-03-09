function problem04(nbDigits)
    min = 10^(nbDigits - 1)
    max = 10^nbDigits - 1

    largest = 0

    for i in max:-1:min
        for j in i:-1:min
            p = i * j
            if string(p) == reverse(string(p))
                largest = p
            end
        end
    end
    return largest
end

function problem04_optimized(nbDigits)
    min = 10^(nbDigits - 1)
    max = 10^nbDigits - 1

    largest = 0
    i = max
    
    while i >= min
        if i % 11 == 0
            j = max
            dj = 1
        else
            j = max - max % 11
            dj = 11
        end
        while j >= i
            p = i * j
            if p <= largest
                break
            end
            if string(p) == reverse(string(p))
                largest = p
            end
            j -= dj
        end

        i-= 1
    end
    return largest
end

println(problem04_optimized(3))