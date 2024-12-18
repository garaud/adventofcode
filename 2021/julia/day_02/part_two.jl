include("common.jl")


"Position type"
struct Position
    horizontal::Int
    depth::Int
    aim::Int
    Position() = new(0, 0, 0)
    Position(horizontal, depth, aim) = new(horizontal, depth, aim)
end


"Move the position forward"
function forward(position::Position, step::Int)
    depth = position.depth + position.aim * step
    Position(position.horizontal + step, depth, position.aim)
end


"Move the position up"
function up(position::Position, step::Int)
    Position(position.horizontal, position.depth, position.aim - step)
end


"Move the position down"
function down(position::Position, step::Int)
    Position(position.horizontal, position.depth, position.aim + step)
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


"Move the submarine according to the command list then multiply the horizontal position and depth"
function compute_with_aim(data)
    submarine = Position()
    for item in data
        command_name, step = split_instruction(item)
        submarine = command(submarine, command_name, step)
    end
    submarine.horizontal * submarine.depth
end


function main()
    data = readinput("input")
    compute_with_aim(data)
end
