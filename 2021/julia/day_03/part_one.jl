include("common.jl")


"compute the gamma rate"
function gamma_rate(data::Vector)::Vector{Int}
    result = []
    num_bits = length(data[1])
    for n in range(1, num_bits)
        bits = nth_bits(data, n)
        append!(result, Int(most_common_bit(bits)))
    end
    result
end


"compute the epsilon rate from the gamma rate"
function epsilon_rate(gamma::Vector{Int})::Vector{Int}
    [x == 1 ? 0 : 1 for x in gamma]
end


"compute the power consumption from the diagnostic binary report"
function power_consumption(data::Vector)
    gamma_bits = gamma_rate(data)
    epsilon_bits = epsilon_rate(gamma_bits)
    # turn the vector of int into a string and then parse it to get the underlying
    # integer
    gamma = parse(Int, join(gamma_bits), base=2)
    epsilon = parse(Int, join(epsilon_bits), base=2)
    gamma * epsilon
end


function main()
    data = readinput("input")
    power_consumption(data)
end
