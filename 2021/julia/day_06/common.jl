
"read a command input file"
function readinput(fpath)
    open(fpath, "r") do fobj
        raw = read(fobj, String)
        return [parse(Int, x) for x in split(strip(raw), ",")]
    end
end
