defmodule Advent.Day03 do
  @moduledoc """
  Day 03 - Mull It Over

  Extract 'mul(n, m)' from a corrupted input file.

  ❯ mix run -e 'Advent.Day03.main()

  ## Part one

  The computer appears to be trying to run a program, but its memory (your puzzle input) is corrupted. All of the
  instructions have been jumbled up!

  It seems like the goal of the program is just to multiply some numbers. It does that with instructions like mul(X,Y),
  where X and Y are each 1-3 digit numbers. For instance, mul(44,46) multiplies 44 by 46 to get a result of 2024.
  Similarly, mul(123,4) would multiply 123 by 4.

  For example, consider the following section of corrupted memory:

  `xmul(2,4)%&mul[3,7]!@^do_not_mul(5,5)+mul(32,64]then(mul(11,8)mul(8,5)`

   Only the four highlighted sections are real mul instructions. Adding up the result of each instruction produces 161
   (2*4 + 5*5 + 11*8 + 8*5).

   ## Part two

   There are two new instructions you'll need to handle:

    The do() instruction enables future mul instructions.
    The don't() instruction disables future mul instructions.

  Only the most recent do() or don't() instruction applies. At the beginning of the program, mul instructions are
  enabled.

  For example:

  `xmul(2,4)&mul[3,7]!^don't()_mul(5,5)+mul(32,64](mul(11,8)undo()?mul(8,5))`

  This corrupted memory is similar to the example from before, but this time the mul(5,5) and mul(11,8) instructions are
  disabled because there is a don't() instruction before them. The other mul instructions function normally, including
  the one at the end that gets re-enabled by a do() instruction.

  This time, the sum of the results is 48 (2*4 + 8*5).
  """

  @doc """
  Extract the two number from the 'mul(n,m)' pattern.
  """
  def extract_number(line) do
    ~r/mul\((?<left>\d+),(?<right>\d+)\)/
    |> Regex.scan(line, capture: :all_names)
    |> Enum.map(fn x -> Enum.map(x, &String.to_integer/1) end)
  end

  @doc """
  Split the line string by the pattern `don't()`
  """
  def split_dont(line) do
    Regex.split(~r/don't\(\)/, line)
  end

  @doc """
  Splot the line string by the pattern `do()`
  The first part is necessarily a "don't" section. The rest of the content is a "do".
  If the index begins with '0', it's a "don't" section. If not, it's a "do".
  """
  def split_do(line) do
    ~r/do\(\)/ |> Regex.split(line) |> Enum.with_index() |> Enum.filter(fn {_, idx} -> idx > 0 end)
  end

  @doc """
  Compute the multiplication of a pair, between left and right
  """
  def compute(pair) do
    List.first(pair) * List.last(pair)
  end

  @spec solve_part_one(String.t()) :: integer()
  @doc """
  Solve the part one.

  Extract 'mul(n,m)' patterns, convert the string to number, carry out a multiplication between each pair and
  compute the sum
  """
  def solve_part_one(fname) do
    content = Advent.read_input("03", fname)
    numbers = extract_number(content)
    # sum of product
    # XXX: maybe we can also use List.foldl to reduce
    # numbers |> Enum.map(fn x -> List.first(x) * List.last(x) end) |> Enum.reduce(fn x, acc -> x + acc end)
    numbers |> Enum.map(&compute/1) |> Enum.reduce(fn x, acc -> x + acc end)
  end

  @doc """
  Solve the part two.

  Take into account of keyword "don't" and "do" in order to extract the 'mul(n,m)' which will be computed.
  """
  def solve_part_two(fname) do
    content = Advent.read_input("03", fname)
    # the first one is always taken into account
    {first, rest} = List.pop_at(split_dont(content), 0)
    docontent = rest |> Enum.map(&split_do/1) |> List.flatten() |> Enum.map(fn {c, _} -> c end)

    [first]
    |> Enum.concat(docontent)
    |> Enum.map(&extract_number/1)
    |> Enum.concat()
    |> Enum.map(&compute/1)
    |> Enum.reduce(fn x, acc -> x + acc end)
  end

  def main do
    result = solve_part_one("inputs")
    IO.puts("result part-one: #{result}")
    result = solve_part_two("inputs")
    IO.puts("result part-two: #{result}")
  end
end
