


# Rock > Scissors
# Scissors > Paper
# Paper > Rock

struct Shape
    name::String
    score::Int
    function Shape(letter)
        if letter in ["A", "X"]
            new("Rock", 1)
        elseif letter in ["B", "Y"]
            new("Paper", 2)
        elseif letter in ["C", "Z"]
            new("Scissors", 3)
        else
            new("Unknown", -1)
        end
    end
end

"overload less that operator"
function Base.:<(left::Shape, right::Shape)
    if left.name == "Rock"
        if right.name == "Paper"
            return true
        else
            return false
        end
    elseif left.name == "Paper"
        if right.name == "Scissors"
            return true
        else
            return false
        end
    else
        if right.name == "Rock"
            return true
        else
            return false
        end
    end
end



"6 if win, 3 draw, 0 lose"
function score(left, right)
    if left == right
        return 3
    elseif left < right
        return 0
    else
        return 6
    end
end


"guess the winner and compute the score for a round"
function score_round(round::AbstractString)
    left, right = split(round)
    shape_left = Shape(left)
    shape_right = Shape(right)
    score(shape_right, shape_left) + shape_right.score
end


"read the input text file"
function readinput(fpath)
    open(fpath, "r") do fobj
        # read the text file as string
        split(strip(read(fobj, String)), "\n")
    end
end
