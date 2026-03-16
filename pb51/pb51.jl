include("../utils/utils.jl")

prime_list = primes(1_000_000)
prime_set = Set(prime_list)

function pb51()
    for p in prime_list
        # Instruction let us know that it must be after 56_000
        if p < 56000
            continue
        end
        
        s_dig = digits(p)
        
        # Check every digit from 0 to 2, the starting digit must be 0, 1, 2
        for target_dig in 0:2
            # Find indices where the digit matches the target
            pos = findall(x -> x == target_dig, s_dig[2:end]) .+ 1
            
            # We know it must be 3 same digits
            if length(pos) == 3
                # Create the mask
                mask = sum(10 .^ (pos .- 1))
                
                fam_count = 0
                first_prime = 0
                
                for rep in 0:9
                    # Get candidate using the mask
                    cand = p - (target_dig * mask) + (rep * mask)
                    
                    if cand >= 10^(length(s_dig) - 1) && cand in prime_set
                        fam_count += 1
                        if first_prime == 0
                            first_prime = cand
                        end
                    end
                end
                
                if fam_count == 8
                    return first_prime
                end
            end
        end
    end
end

println(pb51())
