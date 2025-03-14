function problem22(names_file)
    names = []

    open(pwd() * names_file) do f
        names = split(replace(read(f, String), "\"" => ""), ",")
    end
    names = sort(names)
    
    sum = 0
    for (i, name) in enumerate(names)
        sum_of_name = 0
        for c in name
            sum_of_name += Int(c) - 64
        end
        sum += i * sum_of_name
    end

    return sum
end

println(problem22("/sources/0022_names.txt"))