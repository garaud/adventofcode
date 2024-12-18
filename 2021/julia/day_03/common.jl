using Statistics


"read a command input file"
function readinput(fpath)
    open(fpath, "r") do fobj
        raw = read(fobj, String)
        split(strip(raw), "\n")
    end
end


"Get the nth bits"
function nth_bits(data::Vector, n::Int)::Vector{Int}
    [parse(Int, v[n]) for v in data]
end


"find the most common bit"
function most_common_bit(bits::Vector{Int})::Float32
    result = median(bits)
end
