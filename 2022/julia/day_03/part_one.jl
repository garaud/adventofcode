include("common.jl")


"find item type that appears in bot compartments and compute the priority"
function find_items_priority(data)
    scores = [get_priority(rucksack) for rucksack in data]
    sum(scores)
end


"print the solution"
function main()
    data = readinput("input")
    find_items_priority(data)
end
