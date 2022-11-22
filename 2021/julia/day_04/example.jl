include("common.jl")

rawdata = readinput("test.txt")

# bingo numbers
n = extract_bingo_numbers(rawdata)

# build a board, the first one for instance (2nd line)
b = build_board(rawdata[2])
# b.grid
# b.mask

mark_board(b, 7)
# b.mask

# boards collection
boards = extract_boards(rawdata)
