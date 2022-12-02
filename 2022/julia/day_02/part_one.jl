include("common.jl")


"Compute the total score"
function total_score(guide)
    sum([score_round(round) for round in guide])
end


"print the solution"
function main()
    data = readinput("input")
    total_score(data)
end
