using Test

include("common.jl")
include("part_one.jl")

@testset "compute the final score of the winning board" begin
    data = readinput("test.txt")
    @test final_score(data) == 4512
end
