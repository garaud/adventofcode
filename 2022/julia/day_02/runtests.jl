using Test

include("part_one.jl")


@testset "Check the total score following the strategy guide" begin
    data = readinput("test.txt")
    @test total_score(data) == 15
end
