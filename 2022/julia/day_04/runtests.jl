using Test

include("part_one.jl")
include("part_two.jl")


@testset "Check the number of assignment where one contains the other" begin
    data = readinput("test.txt")
    @test count_assignment_pairs(data) == 2
end


@testset "Check the number of assignmentIn pairs do the ranges overlap?" begin
    data = readinput("test.txt")
    @test count_overlaps(data) == 4
end

