using Dates

function problem19(from, to)
    count = 0
    for year in from:to
        for month in 1:12
            d = Date(year, month, 1)
            if dayofweek(d) == 7
                count += 1
            end
        end
    end

    return count
end

println(problem19(1901, 2000))