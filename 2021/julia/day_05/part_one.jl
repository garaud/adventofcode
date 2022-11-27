# using DataFrames

include("common.jl")


"all points for all lines"
function all_points(lines)
    res = []
    for line in lines
        append!(res, line_iterator(line))
    end
    res
end


"count the point occurrence"
function point_counter(seq::Vector)
    res = Dict()
    for point in seq
        get!(res, point, 0)
        res[point] += 1
    end
    res
end


"the number of points where at least two lines overlap"
function points_overlap(data)
    lines = filter_lines(make_lines(data))
    points = all_points(lines)
    counter = point_counter(points)
    # count the Point which occur >= 2
    sum([1 for x in values(counter) if x >= 2])
end


function main()
    data = readinput("input")
    points_overlap(data)
end
