using BenchmarkTools

function pb42(words_file)
    words = []

    open(pwd() * words_file) do f
        words = split(replace(read(f, String), "\"" => ""), ",")
    end
    words = sort(words)
    
    count = 0
    for w in words
        sum_of_word = 0
        for c in w
            sum_of_word += Int(c) - 64
        end
        
        n = 1
        while 1/2 * n * (n + 1) < sum_of_word
            n += 1
        end

        if 1/2 * n * (n + 1) == sum_of_word
            count += 1
        end
    end

    return count
end

println(pb42("/sources/0042_words.txt"))

@btime pb42("/sources/0042_words.txt")