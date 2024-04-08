defmodule Advent.Day02 do
@moduledoc """
Day 02 - Cube Conundrum

You've arrived at Snow Island. You met an Elf who wanted to play a game with you with a bag of cubes. The cubes can be in red,
blue or green.

You have to check all possible games for a specific number of red, blue and green cube. The result is the sum of possible Game ID.

Determine which games would have been possible if the bag had been loaded with only 12 red cubes, 13 green cubes, and 14 blue
cubes.

For part two, in each game you played, what is the fewest number of cubes of each color that could have been in the bag to make
the game possible?
"""

  # maximum number of cubes for each color (just used for the part one)
  @red_cube 12
  @green_cube 13
  @blue_cube 14
  @colors [:red, :green, :blue]


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


  @doc """
  Extract a game from a line string. Get the game id and the number of drawing cubes for each color.
  """
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


  @doc """
  Get the max number of cubes for each color
  """
  def max_cubes(game) do
    colors = Enum.filter(@colors, fn x -> Map.fetch(game, x) != :error end)
    Enum.map(colors, fn x -> Enum.max(game[x]) end)
  end

  @doc """
  Just compute the product of the max number of cubes
  """
  def cube_product(maxcubes) do
    Enum.reduce(maxcubes, fn x, acc -> x * acc end)
  end


  @doc """
  Guess if a game is possible according to the max number of cube available in the bags for each color.
  Then, sum the ids of possible games.
  """
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

  @doc """
  Get the minimum number of color cubes for each game to make the game possible.
  Multily these numbers (one for each color) for each game, then add up these numbers
  """
  def solve_part_two(fname) do
    content = Advent.read_input("02", fname)
    lines = String.split(content, "\n")
    # extract all games
    games = Enum.map(lines, &extract_game/1)
    # get the max number of drawing cube for each color
    values = Stream.map(games, &max_cubes/1)
    # compute the number of cubes multiplied together
    products = Enum.map(values, &cube_product/1)
    # them compute the sum
    Enum.reduce(products, fn x, acc -> x + acc end)
  end


  def main() do
    result = solve_part_one("inputs")
    IO.puts("result part-one: #{result}")
    result = solve_part_two("inputs")
    IO.puts("result part-two: #{result}")
  end
end
