using Test

include("part_one.jl")


@testset "Check the value of the priority for duplicated items" begin
    data = readinput("test.txt")
    @test find_items_priority(data) == 157
end
