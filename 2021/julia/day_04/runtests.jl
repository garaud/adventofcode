using Test

include("common.jl")
include("part_one.jl")
include("part_two.jl")

@testset "compute the final score of the winning board" begin
    data = readinput("test.txt")
    @test final_score(data) == 4512
end


@testset "compute the final score of the latest winning board" begin
    data = readinput("test.txt")
    @test latest_final_score(data) == 1924
end
