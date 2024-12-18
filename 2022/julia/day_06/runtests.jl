using Test

include("part_one.jl")


@testset "Description" begin
    data = readinput("test.txt")
    @test compute(data) == 42
end
