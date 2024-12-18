"""Test day01 - Historian Hysteria"""

from advent import FileType
from advent.day01 import solve_part_one, solve_part_two


def test_part_one():
    expected = 11
    assert solve_part_one(FileType.TEST_ONE) == expected


def test_part_two():
    expected = 31
    assert solve_part_two(FileType.TEST_TWO) == expected
