defmodule Advent.Day02 do
@moduledoc """
Day 02 - Cube Conundrum

You've arrived at Snow Island. You met an Elf who wanted to play a game with you with a bag of cubes. The cubes can be in red,
blue or green.

You have to check all possible games for a specific number of red, blue and green cube. The result is the sum of possible Game ID.

Determine which games would have been possible if the bag had been loaded with only 12 red cubes, 13 green cubes, and 14 blue
cubes.
"""

  @red_cube 12
  @green_cube 13
  @blue_cube 14


  @doc """
  Extract the game id from a line string. In form 'Game XX: 3 blue, 2 red...'
  """
  def extract_game_id(line) do
    captured = Regex.named_captures(~r/^Game (?P<game_id>\d+)/, line)
    %{game_id: String.to_integer(captured["game_id"])}
  end


  @doc """
  Extract the number of red cubes from a line string
  """
  def extract_red_cubes(line) do
    matches = Regex.scan(~r/(\d+) red/, line)
    # match such as ["red 4", "4"]. Want to retrieve the last element and turn it into an interger
    %{red: Enum.map(matches, fn x -> String.to_integer(Enum.at(x, 1)) end)}
  end

  @doc """
  Extract the number of blue cubes from a line string
  """
  def extract_blue_cubes(line) do
    matches = Regex.scan(~r/(\d+) blue/, line)
    %{blue: Enum.map(matches, fn x -> String.to_integer(Enum.at(x, 1)) end)}
  end

  @doc """
  Extract the number of green cubes from a line string
  """
  def extract_green_cubes(line) do
    matches = Regex.scan(~r/(\d+) green/, line)
    %{green: Enum.map(matches, fn x -> String.to_integer(Enum.at(x, 1)) end)}
  end


  def extract_game(line) do
    game = extract_game_id(line)
    blue_cube = extract_blue_cubes(line)
    red_cube = extract_red_cubes(line)
    green_cube = extract_green_cubes(line)
    Enum.reduce([game, blue_cube, red_cube, green_cube], %{}, fn x, acc -> Map.merge(acc, x) end)
  end

  @doc """
  Check if the game is possible according to the number of drawing cubes
  """
  def is_possible?(game) do
    blue = Enum.reduce(game[:blue], true, fn x, acc -> acc and (x <= @blue_cube) end)
    red = Enum.reduce(game[:red], true, fn x, acc -> acc and (x <= @red_cube) end)
    green = Enum.reduce(game[:green], true, fn x, acc -> acc and (x <= @green_cube) end)
    blue and red and green
  end


  def solve_part_one(fname) do
    content = Advent.read_input("02", fname)
    lines = String.split(content, "\n")
    # extract all games
    games = Enum.map(lines, &extract_game/1)
    # just keep the possible games
    possible_games = Enum.filter(games, &is_possible?/1)
    # sum the game id (only in possible games)
    Enum.reduce(possible_games, 0, fn x, acc -> acc + x[:game_id] end)
  end


  def main() do
    result = solve_part_one("inputs")
    IO.puts("result part-one: #{result}")
  end
end
