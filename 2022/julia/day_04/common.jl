
struct Section
    x::Int
    y::Int
end


"does one section contain the other"
function is_contain(left::Section, right::Section)::Bool
    if ((left.x >= right.x) & (left.x <= right.y)) & ((left.y >= right.x) & (left.y <= right.y))
        return true
    elseif ((right.x >= left.x) & (right.x <= left.y)) & ((right.y <= left.y) & (right.y >= left.x))
        return true
    else
        return false
    end
end


"do sections overlap each other or not"
function do_not_overlap(left::Section, right::Section)::Bool
    if ((left.x < right.x) & (left.x < right.y)) & ((left.y < right.x) & (left.y < right.y))
        return true
    elseif ((right.x < left.x) & (right.x < left.y)) & ((right.y < left.y) & (right.y < left.x))
        return true
    else
        return false
    end
end


"extract each section from a line"
function sections_pair(line::AbstractString)
    left, right = split(line, ",")
    left = split(left, "-")
    right = split(right, "-")
    xleft, yleft = parse(Int, left[1]), parse(Int, left[2])
    xright, yright = parse(Int, right[1]), parse(Int, right[2])
    return Section(xleft, yleft), Section(xright, yright)
end


function foo(line)
    l, r = sections_pair(line)
    println(l, " - ", r)
    return is_contain(l, r)
end


"read the input text file"
function readinput(fpath)
    open(fpath, "r") do fobj
        # read the text file as string
        split(strip(read(fobj, String)), "\n")
    end
end
