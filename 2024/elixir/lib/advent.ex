defmodule Advent do
  @moduledoc """
  Documentation for `Advent`.
  """

  @doc """
  Hello world.

  ## Examples

      iex> Advent.hello()
      :world

  """
  def hello do
    :world
  end

  @doc """
  Read an input file (text) in the form 'day-{nn}/inputs.txt'
  """
  def read_input(day, filetype) do
    fpath = Path.join([File.cwd!(), "inputs", "day-#{day}", "#{filetype}.txt"])
    fpath |> File.read!() |> String.trim()
  end
end
