using Test

include("common.jl")
include("part_one.jl")

@testset "the number of points where at least two lines overlap" begin
    data = readinput("test.txt")
    @test points_overlap(data) == 5
end
