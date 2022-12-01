
"turn a raw line into a list of ints"
function calories_single_elf(line)
    [parse(Int, item) for item in split(strip(line), "\n")]
end


"read the input text file"
function readinput(fpath)
    open(fpath, "r") do fobj
        # read the text file as string
        split(read(fobj, String), "\n\n")
    end
end
