include("common.jl")


"get the latest winning board and compute its score"
function latest_final_score(data)
    drawing_count = 0
    winners = []
    bingo_numbers = extract_bingo_numbers(data)
    # list of board
    boards = extract_boards(data)
    # loop on each drawning bingo numbers
    for num in bingo_numbers
        if length(winners) == length(boards)
            break
        end
        # loop on each board and mark it
        drawing_count += 1
        for (index, board) in enumerate(boards)
            if index in winners
                continue
            end
            mark_board(board, num)
            # check if there is a winner
            if is_winning_board(board)
                append!(winners, index)
            end
        end
    end
    latest_board_index = winners[length(winners)]
    return bingo_numbers[drawing_count] * board_score(boards[latest_board_index])
end


function main()
    data = readinput("input")
    latest_final_score(data)
end
