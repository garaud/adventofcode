include("common.jl")


"split by group of three"
function split_by_group(data)
    size = length(data)
    count = Int(size / 3)
    slice = [(i + (2*(i-1)), (i + (2*(i-1)) + 2)) for i in range(1,count)]
    return [data[i:j] for (i,j) in slice]
end


"find the badge from the group of three elves"
function find_badge(group)
    return intersect(group[1], group[2], group[3])[1]
end


"find item type that appears in bot compartments and compute the priority"
function compute_badge_priority(data)
    sum(SCORES[find_badge(pack)] for pack in split_by_group(data))
end


"print the solution"
function main()
    data = readinput("input")
    compute_badge_priority(data)
end
