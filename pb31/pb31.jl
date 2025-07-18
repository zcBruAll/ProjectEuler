using BenchmarkTools

function pb31(target, coins)
    dp = zeros(target + 1)
    dp[1] = 1
    for c in coins
        for m in (c + 1):(target + 1)
            dp[m] += dp[m - c]
        end
    end
    return dp[target + 1]
end

println(pb31(200, [1, 2, 5, 10, 20, 50, 100, 200]))

@btime pb31(200, [1, 2, 5, 10, 20, 50, 100, 200])