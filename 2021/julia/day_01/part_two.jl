include("part_one.jl")


"Compute how many values are larger than the previous ones with a window of 3"
function how_many_larger_window(data::Vector{Int64})
    # sum of three measurements
    window = [sum(data[i:i+2]) for i in range(1, length(data) - 2)]
    how_many_larger(window)
end


"print the solution"
function main()
    data = readinput("input")
    how_many_larger_window(data)
end
