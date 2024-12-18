defmodule Advent.Day04 do
  @moduledoc """
  Day 04 - Ceres Search

  Retrieve all 'XMAS' occurrence in a matrix of letters!
  vertical, horizontal, diagonal et backward

  ❯ mix run -e 'Advent.Day04.main()

  ## Part one

  As the search for the Chief continues, a small Elf who lives on the station tugs on your shirt; she'd like to know if
  you could help her with her word search (your puzzle input). She only has to find one word: XMAS.

  This word search allows words to be horizontal, vertical, diagonal, written backwards, or even overlapping other
  words. It's a little unusual, though, as you don't merely need to find one instance of XMAS - you need to find all of
  them. Here are a few ways XMAS might appear, where irrelevant characters have been replaced with .:

  ```
  ..X...
  .SAMX.
  .A..A.
  XMAS.S
  .X....
  ```

  ## Part two

  --- Part Two ---

  The Elf looks quizzically at you. Did you misunderstand the assignment?

  Looking for the instructions, you flip over the word search to find that this isn't actually an XMAS puzzle; it's an
  X-MAS puzzle in which you're supposed to find two MAS in the shape of an X. One way to achieve that is like this:

  M.S
  .A.
  M.S

  Irrelevant characters have again been replaced with . in the above diagram. Within the X, each MAS can be written
  forwards or backwards.

  Here's the same example from before, but this time all of the X-MASes have been kept instead:

  .M.S......
  ..A..MSMS.
  .M.S.MAA..
  ..A.ASMSM.
  .M.S.M....
  ..........
  S.S.S.S.S.
  .A.A.A.A..
  M.M.M.M.M.
  ..........

  In this example, an X-MAS appears 9 times.

  Flip the word search from the instructions back over to the word search side and try again. How many times does an X-MAS
  appear?
  """

  @doc """
  Transpose the list of lines into a list columns.

  Note that, the number of lines == columns
  """
  def extract_columns(lines) do
    range = length(lines) - 1

    Enum.map(0..range, fn idx ->
      # loop on each index and each line.
      lines |> Enum.map(fn line -> String.at(line, idx) end) |> Enum.reduce(fn x, acc -> acc <> x end)
    end)
  end

  def getitem(lines, i, j) do
    {line, _} = List.pop_at(lines, i)
    String.at(line, j)
  end

  @doc """
  Extract all letters in the specific diagonal
  """
  def extract_diagonal(lines, rowidx, colidx) do
    size = length(lines)
    max_iter = min(size - rowidx - 1, size - colidx - 1)

    0..max_iter
    |> Enum.map(fn idx ->
      getitem(lines, rowidx + idx, colidx + idx)
    end)
    |> Enum.reduce(fn x, acc -> acc <> x end)
  end

  @doc """
  Extract all letters in a specific diagonal from bottom left
  """
  def extract_diagonal_rot90(lines, rowidx, colidx) do
    size = length(lines)
    max_iter = min(size - rowidx - 1, size - colidx - 1)

    0..max_iter
    |> Enum.map(fn idx ->
      getitem(lines, size - 1 - idx - rowidx, colidx + idx)
    end)
    |> Enum.reduce(fn x, acc -> acc <> x end)
  end

  @doc """
  Count the number of occurrence of XMAS (forward and backward) in a string
  """
  def xmas_occurrence(message) do
    (~r/XMAS/ |> Regex.scan(message) |> length()) + (~r/SAMX/ |> Regex.scan(message) |> length())
  end

  @spec solve_part_one(String.t()) :: integer()
  @doc """
  Solve the part one.
  """
  def solve_part_one(fname) do
    content = Advent.read_input("04", fname)
    lines = String.split(content)
    # count the number of XMAS occurence (forward & backward) for each (1) line, (2) column and (3) diagonal
    line_occurrence = lines |> Enum.map(&xmas_occurrence/1) |> Enum.reduce(fn x, acc -> x + acc end)

    column_occurrence =
      lines |> extract_columns() |> Enum.map(&xmas_occurrence/1) |> Enum.reduce(fn x, acc -> x + acc end)

    diagonals_top_right =
      0..(length(lines) - 4)
      |> Enum.map(fn colidx -> extract_diagonal(lines, 0, colidx) end)
      |> Enum.map(&xmas_occurrence/1)

    diagonals_top_left =
      1..(length(lines) - 4)
      |> Enum.map(fn rowidx -> extract_diagonal(lines, rowidx, 0) end)
      |> Enum.map(&xmas_occurrence/1)

    diagonals_bottom_right =
      0..(length(lines) - 4)
      |> Enum.map(fn colidx -> extract_diagonal_rot90(lines, 0, colidx) end)
      |> Enum.map(&xmas_occurrence/1)

    diagonals_bottom_left =
      1..(length(lines) - 4)
      |> Enum.map(fn rowidx -> extract_diagonal_rot90(lines, rowidx, 0) end)
      |> Enum.map(&xmas_occurrence/1)

    diagonal_occurrence =
      [diagonals_top_right, diagonals_top_left, diagonals_bottom_right, diagonals_bottom_left]
      |> List.flatten()
      |> Enum.reduce(fn x, acc -> x + acc end)

    line_occurrence + column_occurrence + diagonal_occurrence
  end

  def find_a_index(content) do
    splitted = Regex.split(~r/A/, content)
    # length of each element
    {first, rest} = splitted |> Enum.map(&String.length/1) |> List.pop_at(0)
    # cumulative sum with each index+1, except the first one
    List.foldl(rest, [first], fn x, acc -> Enum.concat(acc, [x + List.last(acc) + 1]) end)
  end

  @doc """
  Extract the cross around an index from the content according to the lenght of a line (size)
  """
  def extract_cross(content, index, size) do
    top_left = String.at(content, index - size - 2)
    top_right = String.at(content, index - size)
    bottom_left = String.at(content, index + size)
    bottom_right = String.at(content, index + size + 2)
    %{top_left: top_left, top_right: top_right, bottom_left: bottom_left, bottom_right: bottom_right}
  end

  @doc """
  This is a X-MAS cross?

  Should have two 'M'  or 'S' at the bottom, the top, the right or the left.
  """
  def xmas?(cross) do
    all_possibilities = [
      # 'M' top and 'S' bottom
      %{top_left: "M", top_right: "M", bottom_left: "S", bottom_right: "S"},
      # 'S' left and 'M' right
      %{top_left: "S", top_right: "M", bottom_left: "S", bottom_right: "M"},
      # 'S' top and 'M' bottom
      %{top_left: "S", top_right: "S", bottom_left: "M", bottom_right: "M"},
      # 'M' left and 'S' right
      %{top_left: "M", top_right: "S", bottom_left: "M", bottom_right: "S"}
    ]

    Enum.any?(Enum.map(all_possibilities, fn x -> Map.equal?(x, cross) end))
  end

  @doc """
  Solve the part two.

  Do not use the functions of the first implem. Just want to get the index of each 'A' and check if in left-hand and
  right-hand of the 'A' +size, +size+2 and  -size and -size-2 there are two 'S' and two 'M'
  """
  def solve_part_two(fname) do
    content = Advent.read_input("04", fname)
    lines = String.split(content)
    size = length(lines)
    index = find_a_index(content) |> Enum.filter(fn x -> not is_nil(x) end)
    all_crossx = Enum.map(index, fn x -> extract_cross(content, x, size) end)
    length(Enum.filter(all_crossx, &xmas?/1))
  end

  def main do
    result = solve_part_one("inputs")
    IO.puts("result part-one: #{result}")
    result = solve_part_two("inputs")
    IO.puts("result part-two: #{result}")
  end
end
