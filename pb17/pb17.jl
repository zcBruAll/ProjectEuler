function num_to_words(n)
    num_words = Dict(
        1 => "one", 2 => "two", 3 => "three", 4 => "four", 5 => "five", 6 => "six", 7 => "seven",
        8 => "eight", 9 => "nine", 10 => "ten", 11 => "eleven", 12 => "twelve", 13 => "thirteen", 
        14 => "fourteen", 15 => "fifteen", 16 => "sixteen", 17 => "seventeen", 18 => "eighteen",
        19 => "nineteen", 20 => "twenty", 30 => "thirty", 40 => "forty", 50 => "fifty", 60 => "sixty",
        70 => "seventy", 80 => "eighty", 90 => "ninety"
    )

    if haskey(num_words, n)
        return num_words[n]
    end

    if n < 100
        return num_words[n ÷ 10 * 10] * get(num_words, n % 10, "")
    end

    if n < 1000
        result = num_words[n ÷ 100] * "hundred"
        if n % 100 != 0
            result *= "and" * num_to_words(n % 100)
        end
        return result
    end

    if n == 1000
        return "onethousand"
    end

    return ""
end

function problem17(max)
    return sum(length(num_to_words(i)) for i in 1:max)
end

println(problem17(1000))