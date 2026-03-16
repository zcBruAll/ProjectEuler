function pb52()
    i = 10
    solution = false
    while !solution
        dig = digits(i)
        len = length(dig)
        first_digit = div(i, 10^(len-1))
        if first_digit > 1
            i = 10^len 
            continue
        end
        solution = true
        sorted_dig = sort(dig)
        for n in 1:6
            if sorted_dig != sort(digits(i*n))
                solution = false
                break
            end
        end
        if solution
            return i
        end
        i += 1
    end
    
    return i - 1
end

println(pb52())
