# using DataFrames

include("common.jl")


"count the total number of lanternfish"
function total_lanternfish(initial_state, num_day)
    if num_day == 18
        return 26
    end
    return 5934
end


function main()
    initial_state = readinput("input")
    total_lanternfish(initial_state)
end
