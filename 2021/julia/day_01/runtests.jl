using Test

include("part_one.jl")
include("part_two.jl")

@testset "number of larger measurements in the test file" begin
    data = readinput("test.txt")
    @test how_many_larger(data) == 7
end


@testset "number of larger measurements with a 3-window in the test file" begin
    data = readinput("test.txt")
    @test how_many_larger_window(data) == 5
end
