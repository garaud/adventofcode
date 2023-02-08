using Test

include("part_one.jl")


@testset "Description" begin
    data = readinput("test.txt")
    @test total_size(data) == 95437
end
