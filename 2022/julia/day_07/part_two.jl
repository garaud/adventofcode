include("common.jl")


"Compute the value"
function compute_two(data)
    return 42
end


"print the solution"
function main()
    data = readinput("input")
    compute_two(data)
end
