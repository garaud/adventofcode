
"read the input text file"
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


"Compute how many values are larger than the previous ones"
function how_many_larger(data::Vector{Int64})
    size = length(data)
    # difference between v[i+1] and v[i]
    difference = data[2:size] - data[1:size - 1]
    # count the number of positive values
    sum(map(x -> x > 0, difference))
end


"print the solution"
function main()
    data = readinput("input")
    how_many_larger(data)
end
