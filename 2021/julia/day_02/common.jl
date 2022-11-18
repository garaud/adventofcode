
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
