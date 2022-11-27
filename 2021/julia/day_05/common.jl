
"Point"
struct Point
    x::Int
    y::Int
    Point(x, y) = new(x, y)
    "constructor from a string in the form 'a,b'"
    function Point(item::AbstractString)
        x, y = split(item, ",")
        new(parse(Int, x), parse(Int, y))
    end
end

"Line"
struct Line
    A::Point
    B::Point
    "constructor from a string x1,y1 -> x2,y2"
    function Line(linestr::AbstractString)
        left, _, right = split(linestr)
        new(Point(left), Point(right))
    end
end


"discard line coords which don't have x1=x2 or y1=y2"
function filter_lines(lines)
    filter(line -> (line.A.x == line.B.x) || (line.A.y == line.B.y), lines)
end


"Make a list of Lines"
function make_lines(data)
    [Line(item) for item in data]
end


"iterate over the line and return a list of points inside the segment"
function line_iterator(line::Line)::Vector{Point}
    list_point = []
    step_x = line.A.x < line.B.x ? 1 : -1
    step_y = line.A.y < line.B.y ? 1 : -1
    x_coord = line.A.x
    y_coord = line.A.y
    while (x_coord != line.B.x) || (y_coord != line.B.y)
        push!(list_point, Point(x_coord, y_coord))
        step_x = x_coord == line.B.x ? 0 : step_x
        step_y = y_coord == line.B.y ? 0 : step_y
        x_coord = x_coord + (step_x) * 1
        y_coord = y_coord + (step_y) * 1
    end
    push!(list_point, Point(x_coord, y_coord))
    return list_point
end


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


"read the input file"
function readinput(fpath)
    open(fpath, "r") do fobj
        raw = read(fobj, String)
        rawdata = split(strip(raw), "\n")
    end
end
