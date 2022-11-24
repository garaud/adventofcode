
"default size of the grid"
SIZE = 5


"5x5 grid"
mutable struct Board
    grid::Matrix{Int}
    mask::Matrix{Int}
    Board(grid) = new(grid, zeros(Int, SIZE, SIZE))
end


"tell if yes or no, a board wins"
function is_winning_board(board::Board)::Bool
    # any row or column are marked
    colsum = sum(board.mask, dims=1)
    rawsum = sum(board.mask, dims=2)
    if SIZE in colsum
        return true
    elseif SIZE in rawsum
        return true
    else
        return false
    end
end


"update a board according to a drawing bingo number"
function mark_board(board::Board, number::Int)::Board
    board.mask = board.mask .+ (board.grid .== number)
    return board
end


"Extract the random numbers drawed"
function extract_bingo_numbers(data::Vector)::Vector{Int}
    # just extract the first raw
    [parse(Int, x) for x in split(data[1], ",")]
end


"Function which builds a board object from a linestring"
function build_board(linestr::AbstractString)
    result = zeros(Int, SIZE, SIZE)
    V = split(linestr, "\n")
    for irow in range(1, SIZE)
        for (icol, value) in enumerate([parse(Int, x) for x in split(V[irow])])
            result[irow, icol] = value
        end
    end
    Board(result)
end


"Extract the list of Boards"
function extract_boards(data::Vector)::Vector{Board}
    result = []
    for line in data[2:length(data)]
        push!(result, build_board(line))
    end
    result
end


"compute the score of a board, i.e. sum of all unmarked numbers"
function board_score(board::Board)::Int
    sum([board.grid[ind] for ind in CartesianIndices(board.mask) if board.mask[ind] == 0])
end


"read a command input file"
function readinput(fpath)
    open(fpath, "r") do fobj
        raw = read(fobj, String)
        rawdata = split(strip(raw), "\n\n")
    end
end
