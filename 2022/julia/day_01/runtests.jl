using Test

include("part_one.jl")
include("part_two.jl")


@testset "How many total Calories is the Elf carrying the most ones?" begin
    data = readinput("test.txt")
    @test total_calories(data) == 24000
end


@testset "Sum of the top three Elves carrying the most Calories" begin
    data = readinput("test.txt")
    @test total_calories_top_three(data) == 45000
end
