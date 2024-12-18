using Test

include("common.jl")
include("part_one.jl")
include("part_two.jl")

@testset "the number of points where at least two lines overlap" begin
    data = readinput("test.txt")
    @test points_overlap(data) == 5
end


@testset "the number of points where at least two lines overlap with diagonals" begin
    data = readinput("test.txt")
    @test points_overlap_with_diagonals(data) == 12
end
