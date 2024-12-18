include("common.jl")


"compute oxygen generator rating"
function oxygen_generator_rating(data)
    result = copy(data)
    num_bits = length(data[1])
    # for each range of bits, just keep the rows which begins by the most
    # representative bit
    for n in range(1, num_bits)
        bits = nth_bits(result, n)
        m = most_common_bit(bits)
        if m>=0.5
            # keep only row which begin by 1
            result = [item for (mask, item) in zip([x == 1 for x in bits], result) if mask]
        elseif m == 0.0
            # keep only row which begin by 0
            result = [item for (mask, item) in zip([x == 0 for x in bits], result) if mask]
        end
        if length(result) == 1
            r = result[1]
            break
        end
    end
    r = result[1]
    parse(Int, join(r), base=2)
end


"compute the co2 scrubber rating"
function co2_scrubber_rating(data)
    result = copy(data)
    num_bits = length(data[1])
    # for each range of bits, just keep the rows which begins by the most
    # representative bit
    for n in range(1, num_bits)
        bits = nth_bits(result, n)
        m = most_common_bit(bits)
        if m == 0.0
            # keep only row which begin by 1
            result = [item for (mask, item) in zip([x == 1 for x in bits], result) if mask]
        elseif m == 1.0
            # keep only row which begin by 0
            result = [item for (mask, item) in zip([x == 0 for x in bits], result) if mask]
        else
            result = [item for (mask, item) in zip([x == 0 for x in bits], result) if mask]
        end
        if length(result) == 1
            r = result[1]
            break
        end
    end
    r = result[1]
    parse(Int, join(r), base=2)
end


"compute the life support rating"
function life_support(data::Vector)
    oxygen = oxygen_generator_rating(data)
    co2 = co2_scrubber_rating(data)
    oxygen * co2
end


function main()
    data = readinput("input")
    life_support(data)
end
