using Test

include("part_one.jl")


@testset "Check the number of assignment where one contains the other" begin
    data = readinput("test.txt")
    @test count_assignment_pairs(data) == 2
end
