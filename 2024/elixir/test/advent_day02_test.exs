defmodule AdventDay02Test do
  use ExUnit.Case
  # doctest Advent

  test "part one" do
    assert Advent.Day02.solve_part_one("test-part") == 2
  end

  # note that the input data is unchanged
  test "part two" do
    assert Advent.Day02.solve_part_two("test-part") == 4
  end
end
