using BenchmarkTools

function pb40(pos)
    product = 1
    for n in pos
        nbdig = 1       # Number of digits in the current block
        totdig = 0      # Total number of digits covered so far
        countdig = 9    # How many numbers are in the current digit-length group

        # Find the block where the nth digit lies
        while n > totdig + countdig * nbdig
            totdig += countdig * nbdig  # Totals digits so far
            nbdig += 1                  # Move to the next digit-length block
            countdig *= 10              # 9, 90, 900, ... numbers per block
        end

        # Offset within the current digit-length block
        offset = n - totdig - 1

        # Determine which number in the current block contains the digit
        nbidx = offset ÷ nbdig  # Index of the number in the current range
        digidx = offset % nbdig # Index of the digit in the number

        # Actual number containing the digit (Start of block + index)
        nb = 10 ^ (nbdig - 1) + nbidx

        # Digit at index
        dig = reverse(digits(nb))[digidx+1]

        product *= dig
    end

    return product
end

println(pb40([1, 10, 100, 1_000, 10_000, 100_000, 1_000_000]))

@btime pb40([1, 10, 100, 1_000, 10_000, 100_000, 1_000_000])