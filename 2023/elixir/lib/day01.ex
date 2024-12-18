defmodule Advent.Day01 do
@moduledoc """
Day 01 - Trebuchet with snow

Find a way to extract first and last digits from a "calibration document"
"""
  def isdigit?(char) do
    case Integer.parse(char) do
      {_, ""} -> true
      _ -> false
    end
  end

  @spec extract_digits(String.t()) :: list()
  @doc """
  Extract the digits from a line string into a list
  """
  def extract_digits(line) do
    Enum.filter(String.codepoints(line), &isdigit?/1)
  end

  @spec extract_digits_and_letters(String.t()) :: list()
  @doc """
  Extract digits and digit spelled out with letters from a line string
  """
  def extract_digits_and_letters(line) do
    # can extract multiple pattern, digit or letter.
    # don't understrand why there are some empty string between each matched group
    seq =
      Regex.scan(~r/(?=(\d|_|one|two|three|four|five|six|seven|eight|nine))/, line)
      |> List.flatten()

    # letter to digit
    l2d = fn x ->
      case x do
        # there are some empty string between each matched group
        "" -> nil
        "one" -> "1"
        "two" -> "2"
        "three" -> "3"
        "four" -> "4"
        "five" -> "5"
        "six" -> "6"
        "seven" -> "7"
        "eight" -> "8"
        "nine" -> "9"
        _ -> x
      end
    end

    Enum.map(seq, l2d) |> Enum.filter(fn x -> not is_nil(x) end)
  end

  @doc """
  Find the calibration values from a sequence of string, i.e. first and last digits
  """
  def find_calibration_value(digits) do
    first = List.first(digits)
    last = List.last(digits)
    # concatenate two digits as string before turning the result into a integer
    String.to_integer(first <> last)
  end

  @spec solve_part_one(String.t()) :: integer()
  @doc """
  extract each first & last digits for each text line.
  sum all numbers
  """
  def solve_part_one(fname) do
    content = Advent.read_input("01", fname)
    records = String.split(content)
    digits = Enum.map(records, &extract_digits/1)
    values = Enum.map(digits, &find_calibration_value/1)
    Enum.reduce(values, fn x, acc -> x + acc end)
  end

  @spec solve_part_two(String.t()) :: integer()
  @doc """
  Solve the sum of each record with first + last digits
  where the digis can be written wit letters such as 'one', 'two', ...
  """
  def solve_part_two(fname) do
    content = Advent.read_input("01", fname)
    records = String.split(content)
    digits = Stream.map(records, &extract_digits_and_letters/1)
    values = Enum.map(digits, &find_calibration_value/1)
    Enum.reduce(values, fn x, acc -> x + acc end)
  end

  def main() do
    result = solve_part_one("inputs")
    IO.puts("result part-one: #{result}")
    result = solve_part_two("inputs")
    IO.puts("result part-two: #{result}")
  end
end
