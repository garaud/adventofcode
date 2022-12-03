


"uppercase and lowercase letters A => Z"
ALL_LETTERS = [lowercase(Char(i)) for i in range(65, 65+25)]
append!(ALL_LETTERS, [uppercase(x) for x in ALL_LETTERS])
"score by letters"
SCORES = Dict([(l,i) for (i,l) in enumerate(ALL_LETTERS)])


"split rucksack into two compartments"
function split_content(rucksack)
    size = length(rucksack)
    offset = Int(size / 2)
    first = rucksack[1:offset]
    second = rucksack[offset+1:size]
    return first, second
end


"check item which appears in both compartment"
function extract_duplicate(rucksack)
    left, right = split_content(rucksack)
    intersect(left, right)[1]
end


"get the priority value based on the duplicated content"
function get_priority(rucksack)
    duplicate = extract_duplicate(rucksack)
    return SCORES[duplicate]
end


"read the input text file"
function readinput(fpath)
    open(fpath, "r") do fobj
        # read the text file as string
        split(strip(read(fobj, String)), "\n")
    end
end
