using Test

include("part_one.jl")
include("part_two.jl")

@testset "horizontal pos x depth the test file" begin
    data = readinput("test.txt")
    @test compute(data) == 150
end


@testset "horizontal pos x depth the test file" begin
    data = readinput("test.txt")
    @test compute_with_aim(data) == 900
end
