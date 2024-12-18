

"read the input text file"
function readinput(fpath)
    open(fpath, "r") do fobj
        # read the text file as string
        split(read(fobj, String), "\n")
    end
end
