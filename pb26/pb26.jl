function pb26(max)
    max_r = 0
    max_i = 1

    for i in 2:max
        x = 1 / i
        r = recurring_cycle_length_working(x)
        if (r >= max_r)
            max_r = r
            max_i = i
        end
    end

    return (max_r, max_i)
end

function recurring_cycle_length_not_working(value)
    length = 1
    while (value * (10 ^ length) != (value * (10 ^ (2 * length))) % (10 ^ length))
        length += 1
    end

    return length
end

# Help required to come up with this solution
function recurring_cycle_length_working(d::Int)
    rem_positions = Dict{Int,Int}()
    rem = 1 % d
    pos = 0

    # Same principles to when solving the division in column
    # Divide one time, get the remainder, multiply by 10 (add a 0 to the result don't care in this ex.), 
    # redo until another remainder pops again meaning it's a loop
    while rem != 0 && !haskey(rem_positions, rem)
        rem_positions[rem] = pos
        rem = (rem * 10) % d
        pos += 1
    end

    if rem == 0
        return 0
    else
        # When the same remainder poped again, return the current position minus the position of its first appearance
        return pos - rem_positions[rem]
    end
end

println(pb26(1_000))