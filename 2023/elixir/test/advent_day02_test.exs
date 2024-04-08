defmodule AdventDay02Test do
  use ExUnit.Case
  import Advent.Day02

  test "extract game id" do
    assert extract_game_id("Game 12: 3 red, 4 green, 1 blue") == %{game_id: 12}
  end

  test "extract number of cubes" do
    line = "Game 12: 3 red, 2 green; 12 blue, 5 red, 1 green"
    assert extract_blue_cubes(line) == %{blue: [12]}
    assert extract_red_cubes(line) == %{red: [3, 5]}
    assert extract_green_cubes(line) == %{green: [2, 1]}
    # if the color does not occur, you should have an empty list
    assert extract_blue_cubes("Game 3: red 3, green 1") == %{blue: []}
  end

  test "part one" do
    assert solve_part_one("test-part-one") == 8
  end
end
