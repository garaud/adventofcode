include("common.jl")


"count the number of overlaping"
function count_overlaps(data)
    count = 0
    for assignment in data
        left, right = sections_pair(assignment)
        if !do_not_overlap(left, right)
            count += 1
        end
    end
    return count
end


"print the solution"
function main()
    data = readinput("input")
    count_overlaps(data)
end
