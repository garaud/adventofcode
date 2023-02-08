include("common.jl")


"count assignment pairs where one fully contains the other"
function count_assignment_pairs(data)
    count = 0
    for assignment in data
        left, right = sections_pair(assignment)
        if is_contain(left, right)
            count += 1
        end
    end
    return count
end


"print the solution"
function main()
    data = readinput("input")
    count_assignment_pairs(data)
end
