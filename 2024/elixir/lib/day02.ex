defmodule Advent.Day02 do
  @moduledoc """
  Day 02 - Red-Nosed Reports

  Find the number of safe reports which should be monotically increasing or descreasing numnbers with at least a
  discrepancy of max 3.

  ❯ mix run -e 'Advent.Day02.main()

  ## Part One

  When I'm thinking about arrays of ints, I'm thinking about Numpy (array + scientific package for Python).

  For each report [4, 6, 7, 8], we can compute the 'diff' between each number of its following number.
  * check if it's monotic, i.e. always negative (descreasing) or positive (increasing)
  * check if the absolute value is always <= 3

  ## Part Two

  The engineers are surprised by the low number of safe reports until they realize they forgot to tell you about the
  Problem Dampener.

  The Problem Dampener is a reactor-mounted module that lets the reactor safety systems tolerate a single bad level in
  what would otherwise be a safe report. It's like the bad level never happened!
  """

  @doc """
  Take a string of whitespaced digits and turn it into an array of integers
  """
  def make_array(line) do
    line |> String.split() |> Enum.map(fn x -> String.to_integer(x) end) |> Nx.tensor()
  end

  @doc """
  For the part two, I want to generate a list of index to discard one element before computing
  if the report is safe.
  """
  def generate_index(size) do
    indices = Enum.to_list(0..(size - 1))
    Enum.map(indices, fn j -> Nx.tensor(Enum.reject(indices, fn i -> i == j end)) end)
  end

  def check_report_with_tolerance(report) do
    # there is a better way: not to check everything. The first element which is safe, we
    # can return true...
    indices = generate_index(Nx.size(report))
    possibilities = Enum.map(indices, fn x -> Nx.take(report, x) end)
    Enum.any?(Enum.map(possibilities, &safe?/1))
  end

  def monotonic?(report) do
    diff = Nx.diff(report)
    size_check = Nx.size(diff)

    0 |> Nx.greater(diff) |> Nx.sum() |> Nx.to_number() == size_check or
      0 |> Nx.less(diff) |> Nx.sum() |> Nx.to_number() == size_check
  end

  @doc """
  Adjacent levels differ by at least one and at most three
  """
  def check_adjacent_levels(report) do
    diff = Nx.diff(report)
    size_check = Nx.size(diff)
    3 |> Nx.greater_equal(Nx.abs(diff)) |> Nx.sum() |> Nx.to_number() == size_check
  end

  @doc """
  Is the report safe: (1) monotonic and (2) not so high discrepancy between adjacent levels
  """
  def safe?(report) do
    monotonic?(report) and check_adjacent_levels(report)
  end

  @spec solve_part_one(String.t()) :: integer()
  @doc """
  extract each first & last digits for each text line.
  compute the distance between the smallest number in the left-hand list
  and the smallest number in the right-hand list.
  Then sum all numbers
  """
  def solve_part_one(fname) do
    content = Advent.read_input("02", fname)
    # read each line
    lines = String.split(content, "\n")
    reports = Enum.map(lines, &make_array/1)
    reports |> Enum.map(&safe?/1) |> Nx.tensor() |> Nx.sum() |> Nx.to_number()
  end

  @doc """
  Quite similar with part one but with at least a single tolerance
  """
  def solve_part_two(fname) do
    content = Advent.read_input("02", fname)
    # read each line
    lines = String.split(content, "\n")
    reports = Enum.map(lines, &make_array/1)
    reports |> Enum.map(&check_report_with_tolerance/1) |> Nx.tensor() |> Nx.sum() |> Nx.to_number()
  end

  def main do
    result = solve_part_one("inputs")
    IO.puts("result part-one: #{result}")
    result = solve_part_two("inputs")
    IO.puts("result part-two: #{result}")
  end
end
