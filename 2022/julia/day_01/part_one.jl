include("common.jl")

"Compute how many calories the Elf which carries the most"
function total_calories(data)
    values = [calories_single_elf(x) for x in data]
    # max of the sum for each elf
    maximum([sum(x) for x in values])
end


"print the solution"
function main()
    data = readinput("input")
    total_calories(data)
end
