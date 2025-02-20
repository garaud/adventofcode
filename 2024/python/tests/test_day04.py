"""Test day04 - Ceres Search"""

from advent import FileType
from advent.day04 import cross, solve_part_one, solve_part_two


def test_xmas_cross():
    content = "\n".join(["M.S", ".A.", "M.S"])
    cp = cross(content, position=5, size=3)
    assert cp.is_xmas
    cp = cross(content, position=6, size=3)
    assert not cp.is_xmas


def test_part_one():
    expected = 18
    assert solve_part_one(FileType.TEST_ONE) == expected


def test_part_two():
    expected = 9
    assert solve_part_two(FileType.TEST_TWO) == expected
