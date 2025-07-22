include("../utils/utils.jl")

using BenchmarkTools

function pb38()
	result = 0
	
	# The starting number can't have more than 4 digits
	# Also by limit starting number we don't need to force check for n > 1
	# Because it must have, at least, 1 concatenation with n = 1 and 2
	for i in 1:10_000
		pan = []

		for n in 1:9
			dig = reverse(digits(i * n))

			if (0 in dig)
				break
			end

			append!(pan, dig)

			# Check for only unique digits
			if length(pan) != length(unique(pan))
				break
			end

			# Check for all 1-to-9 digits
			if sort(pan) == [a for a in 1:9]
				sol = digits_to_number(pan)
				# Only get the largest pandigital number
				if result < sol
					result = sol
				end
				break
			end
		end
	end

	return result
end

function is_1to9_pandigital(n)
    digits_seen = zeros(Bool, 9)
    count = 0

    while n > 0
        d = n % 10
        if d == 0 || digits_seen[d]
            return false
        end
        digits_seen[d] = true
        count += 1
        n ÷= 10
    end

    return count == 9
end

function pb38_optimized()
    result = 0

    for i in 1:9_999
        concat = 0
        multiplier = 1

        while concat < 1_000_000_000
            concat = concat * 10 ^ ndigits(i * multiplier) + i * multiplier
            multiplier += 1

            if is_1to9_pandigital(concat)
                result = max(result, concat)
            end
        end
    end

    return result
end

println(pb38())

@btime pb38()

println(pb38_optimized())

@btime pb38_optimized()
