
struct Command
    name::String
end


struct File
    name::String
    size::Int
end


mutable struct Folder
    name::String
    files::Vector{File}
    folders::Vector{Folder}
    size::Int
end


"parse line and return the command if any"
function parse_line(line::AbstractString)
    if line[1] == '$'
        return Command(line[3:length(line)])
    else
        return "output"
    end
end


"read the input text file"
function readinput(fpath)
    open(fpath, "r") do fobj
        # read the text file as string
        split(read(fobj, String), "\n")
    end
end
