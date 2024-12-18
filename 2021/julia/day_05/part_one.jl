# using DataFrames

include("common.jl")


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
