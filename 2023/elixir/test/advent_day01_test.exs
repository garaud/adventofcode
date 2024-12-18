defmodule AdventDay01Test do
  use ExUnit.Case
  # doctest Advent

  test "extract only digits" do
    assert Advent.Day01.extract_digits("a2xy7bo3j") == ["2", "7", "3"]
    assert Advent.Day01.extract_digits("abcdef") == []
  end

  test "extract digits and letters" do
    assert Advent.Day01.extract_digits_and_letters("one2ythree") == ["1", "2", "3"]
    assert Advent.Day01.extract_digits_and_letters("7oneeight") == ["7", "1", "8"]
    # even if the 'e' is part of 'one' and 'eight', you should extract the two spelled out letters
    assert Advent.Day01.extract_digits_and_letters("7oneight") == ["7", "1", "8"]
  end

  test "part one" do
    assert Advent.Day01.solve_part_one("test-part-one") == 142
  end

  test "part two" do
    assert Advent.Day01.solve_part_two("test-part-two") == 281
  end
end
