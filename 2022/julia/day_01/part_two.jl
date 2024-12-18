include("part_one.jl")


"Compute the sume of calories from the top three Elves"
function total_calories_top_three(data)
    values = [calories_single_elf(x) for x in data]
    # max of the sum for each elf
    total = [sum(x) for x in values]
    # descending sort and sum the top three
    sum(sort(total, rev=true)[1:3])
end


"print the solution"
function main()
    data = readinput("input")
    total_calories_top_three(data)
end
