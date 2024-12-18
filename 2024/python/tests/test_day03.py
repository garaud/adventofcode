"""Test day03 - Mull It Over"""

from advent import FileType
from advent.day03 import solve_part_one, solve_part_two
from advent.day03.main import Pair, extract_numbers


def test_extract_numbers():
    result = extract_numbers("xmul(2,4)&:jazzmul(4,12)b*")
    assert result == [Pair(2, 4), Pair(4, 12)]


def test_part_one():
    expected = 161
    assert solve_part_one(FileType.TEST_ONE) == expected


def test_part_two():
    expected = 48
    assert solve_part_two(FileType.TEST_TWO) == expected
