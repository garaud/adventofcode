using Test

include("part_one.jl")
# include("part_two.jl")

@testset "horizontal pos x depth the test file" begin
    data = readinput("test.txt")
    @test compute(data) == 150
end
