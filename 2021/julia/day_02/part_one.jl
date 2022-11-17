
"Position type"
struct Position
    horizontal::Int
    depth::Int
    Position() = new(0, 0)
    Position(horizontal, depth) = new(horizontal, depth)
end


"Move the position forward"
function forward(position::Position, step::Int)
    Position(position.horizontal + step, position.depth)
end


"Move the position up"
function up(position::Position, step::Int)
    Position(position.horizontal, position.depth - step)
end


"Move the position down"
function down(position::Position, step::Int)
    Position(position.horizontal, position.depth + step)
end


"Apply a command (forward, up, down) to a position"
function command(position::Position, command, step::Int)
    if command == "forward"
        forward(position, step)
    elseif command == "up"
        up(position, step)
    elseif command == "down"
        down(position, step)
    else
        throw(ArgumentError("wrong command: " + command))
    end
end

function split_instruction(item)
    name, value = split(item)
    name, parse(Int, value)
end


"read a command input file"
function readinput(fpath)
    open(fpath, "r") do fobj
        raw = read(fobj, String)
        split(strip(raw), "\n")
    end
end


"Multiply the horizontal position and depth"
function compute(data)
    submarine = Position()
    for item in data
        command_name, step = split_instruction(item)
        submarine = command(submarine, command_name, step)
    end
    submarine.horizontal * submarine.depth
end


function main()
    data = readinput("input")
    compute(data)
end
