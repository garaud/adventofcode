using Test

include("part_one.jl")
include("part_two.jl")


@testset "Check the value of the priority for duplicated items" begin
    data = readinput("test.txt")
    @test find_items_priority(data) == 157
end


@testset "Check the value of the priority for badges" begin
    data = readinput("test.txt")
    @test compute_badge_priority(data) == 70
end
