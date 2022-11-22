include("common.jl")


"compute the score of a board, i.e. sum of all unmarked numbers"
function board_score(board::Board)::Int
    sum([board.grid[ind] for ind in CartesianIndices(board.mask) if board.mask[ind] == 0])
end


"compute the final score of the winning board"
function final_score(data)
    bingo_numbers = extract_bingo_numbers(data)
    # list of board
    boards = extract_boards(data)
    # loop on each drawning bingo numbers
    for num in bingo_numbers
        # loop on each board and mark it
        for board in boards
            mark_board(board, num)
            # check if there is a winner
            if is_winning_board(board)
                return num * board_score(board)
            end
        end
    end
end


function main()
    data = readinput("input")
    final_score(data)
end
