defmodule Advent.Day01 do
  @moduledoc """
  Day 01 - Historian Hysteria

  Find pair of elements between two lists of ints and compute the distance between them.

  ❯ mix run -e 'Advent.Day01.main()
  """

  @doc """
  split a sequence of string, e.g. "4   6", "2   7" into two distinct list
  """
  def split_list(seq) do
    items = Enum.map(seq, &String.split/1)

    %{
      :first => Enum.map(items, fn x -> String.to_integer(List.first(x)) end),
      :second => Enum.map(items, fn x -> String.to_integer(List.last(x)) end)
    }
  end

  @doc """
  compute the number of times a number occurs in a list
  """
  def find_occurrence(number, right_list) do
    Enum.count(right_list, fn x -> x == number end)
  end

  @spec solve_part_one(String.t()) :: integer()
  @doc """
  extract each first & last digits for each text line.
  compute the distance between the smallest number in the left-hand list
  and the smallest number in the right-hand list.
  Then sum all numbers
  """
  def solve_part_one(fname) do
    content = Advent.read_input("01", fname)
    # read each line
    lines = String.split(content, "\n")
    # split the text content into two lists of integers
    lists = split_list(lines)
    first = Enum.sort(lists[:first])
    second = Enum.sort(lists[:second])
    # compute the distance between each element
    distance = Enum.map(Enum.zip(first, second), fn {left, right} -> abs(left - right) end)
    # compute the sum
    Enum.reduce(distance, fn x, acc -> x + acc end)
  end

  @doc """
  extract the digits from the two lists and count the occurrence of each
  left-hand list in the right-hand list.
  Multiply them to compute the 'similarity score'
  Then sum all numbers.
  """
  def solve_part_two(fname) do
    content = Advent.read_input("01", fname)
    # read each line
    lines = String.split(content, "\n")
    # split the text content into two lists of integers
    lists = split_list(lines)
    # find occurrences
    occurrence =
      Map.new(lists[:first], fn x -> {x, find_occurrence(x, lists[:second])} end)

    # similarity score == x * occurrence of x
    similarity = Enum.map(lists[:first], fn x -> x * occurrence[x] end)
    # compute the sum
    Enum.reduce(similarity, fn x, acc -> x + acc end)
  end

  def main do
    result = solve_part_one("inputs")
    IO.puts("result part-one: #{result}")
    result = solve_part_two("inputs")
    IO.puts("result part-two: #{result}")
  end
end
