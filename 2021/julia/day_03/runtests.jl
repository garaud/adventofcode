using Test

include("common.jl")
include("part_one.jl")
include("part_two.jl")

@testset "compute the power consumption from the binary diagnostic" begin
    data = readinput("test.txt")
    @test power_consumption(data) == 198
end


@testset "compute the life support rating" begin
    data = readinput("test.txt")
    @test life_support(data) == 230
end
