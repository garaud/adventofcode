include("common.jl")


function guess_shape(shape, strategy)
    # Y draw
    if strategy == "Y"
        return shape
    # X loose
    elseif strategy == "X"
        if shape.name == "Rock"
            return Shape("Scissors")
        elseif shape.name == "Paper"
            return Shape("Rock")
        else
            return Shape("Paper")
        end
    # Z wins
    else
        if shape.name == "Rock"
            return Shape("Paper")
        elseif shape.name == "Paper"
            return Shape("Scissors")
        else
            return Shape("Rock")
        end
    end
end


"guess the winner and compute the score for a round"
function score_round_with_strategy(round::AbstractString)
    left, strategy = split(round)
    shape_left = Shape(left)
    shape_right = guess_shape(shape_left, strategy)
    score(shape_right, shape_left) + shape_right.score
end


"Compute the total secret score"
function total_secret_score(guide)
    sum([score_round_with_strategy(round) for round in guide])
end


"print the solution"
function main()
    data = readinput("input")
    total_secret_score(data)
end

