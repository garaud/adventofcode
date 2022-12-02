using Test

include("part_one.jl")
include("part_two.jl")


@testset "Check the total score following the strategy guide" begin
    data = readinput("test.txt")
    @test total_score(data) == 15
end


@testset "Check the new total score following the secret strategy guide" begin
    data = readinput("test.txt")
    @test total_secret_score(data) == 12
end
