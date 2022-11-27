using Test

include("common.jl")
include("part_one.jl")


@testset "the number of lanternfish after 18 days" begin
    num_day = 18
    initial_state = readinput("test.txt")
    @test total_lanternfish(initial_state, num_day) == 26
end


@testset "the number of lanternfish after 80 days" begin
    num_day = 80
    initial_state = readinput("test.txt")
    @test total_lanternfish(initial_state, num_day) == 5934
end
