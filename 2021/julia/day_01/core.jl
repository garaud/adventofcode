
function readinput(fpath)
    open(fpath, "r") do fobj
        # read the text file as string
        raw = read(fobj, String)
        # split it
        values = split(strip(raw))
        # turn the vector of str into integers
        map(x -> parse(Int, x), values)
    end
end
