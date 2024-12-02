defmodule AdventDay01Test do
  use ExUnit.Case
  # doctest Advent

  test "part one" do
    assert Advent.Day01.solve_part_one("test-part-one") == 11
  end

  # note that the input data is unchanged
  test "part two" do
    assert Advent.Day01.solve_part_two("test-part-one") == 31
  end
end
