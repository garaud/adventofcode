defmodule AdventDay04Test do
  use ExUnit.Case
  # doctest Advent

  # ABCD
  # QSDF
  # MLKJ
  # WXCV
  test "convert lines to columns" do
    expected = ["AQMW", "BSLX", "CDKC", "DFJV"]
    assert Advent.Day04.extract_columns(["ABCD", "QSDF", "MLKJ", "WXCV"]) == expected
  end

  test "extract diagonal" do
    expected = "ASKV"
    assert Advent.Day04.extract_diagonal(["ABCD", "QSDF", "MLKJ", "WXCV"], 0, 0) == expected
  end

  test "part one" do
    assert Advent.Day04.solve_part_one("test-part-one") == 18
  end

  # note that the input data is unchanged
  test "part two" do
    assert Advent.Day04.solve_part_two("test-part-one") == 9
    assert Advent.Day04.solve_part_two("test-part-two") == 9
  end
end
