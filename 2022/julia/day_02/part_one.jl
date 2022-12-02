include("common.jl")



"guess the winner and compute the score for a round"
function score_round(round::AbstractString)
    left, right = split(round)
    shape_left = Shape(left)
    shape_right = Shape(right)
    score(shape_right, shape_left) + shape_right.score
end


"Compute the total score"
function total_score(guide)
    sum([score_round(round) for round in guide])
end


"print the solution"
function main()
    data = readinput("input")
    total_score(data)
end
