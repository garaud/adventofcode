using Test

include("part_one.jl")


@testset "How many total Calories is the Elf carrying the most ones?" begin
    data = readinput("test.txt")
    @test total_calories(data) == 24000
end
