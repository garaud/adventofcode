defmodule AdventDay03Test do
  use ExUnit.Case
  # doctest Advent

  test "part one" do
    assert Advent.Day03.solve_part_one("test-part-one") == 161
  end

  test "part two" do
    assert Advent.Day03.solve_part_two("test-part-two") == 48
  end
end
