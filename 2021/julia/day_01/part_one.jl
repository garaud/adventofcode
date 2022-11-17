include("core.jl")


"Compute how many values are larger than the previous ones"
function how_many_larger(data::Vector{Int64})
    size = length(data)
    # difference between v[i+1] and v[i]
    difference = data[2:size] - data[1:size - 1]
    # count the number of positive values
    sum(map(x -> x > 0, difference))
end


"print the solution"
function main()
    data = readinput("input")
    how_many_larger(data)
end
