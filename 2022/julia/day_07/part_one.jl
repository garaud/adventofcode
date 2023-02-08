include("common.jl")


"Compute the value"
function compute(data)
    return 42
end


"print the solution"
function main()
    data = readinput("input")
    compute(data)
end
