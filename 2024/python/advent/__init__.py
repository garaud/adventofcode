"""advent package

Advent of code 2024 -- https://adventofcode.com/2024/
"""

from dataclasses import dataclass
from enum import StrEnum, auto
from pathlib import Path

_HERE = Path(__file__).absolute().parent
INPUT_RESOURCES = _HERE / ".." / "inputs"


class FileType(StrEnum):
    """Which kind of file."""

    MAIN = auto()
    TEST_ONE = auto()
    TEST_TWO = auto()


@dataclass
class Day:
    """Where to find the files related to a solving day"""

    number: str  # two digits
    # name of the input test file (part one)
    part_one: str = "test-part-one.txt"
    # name of the input test file (part two)
    part_two: str = "test-part-two.txt"
    input: str = "inputs.txt"  # name of the main input file

    def __repr__(self):
        return f"day-{self.number}"

    def as_input(self, filetype: FileType) -> Path:
        "Return the input file related to the day"
        match filetype:
            case FileType.MAIN:
                return Path(f"day-{self.number}") / self.input
            case FileType.TEST_ONE:
                return Path(f"day-{self.number}") / self.part_one
            case FileType.TEST_TWO:
                return Path(f"day-{self.number}") / self.part_two
            case _:
                raise ValueError(f"Unknown filetype {filetype}")


def read_input(day: Day, filetype: FileType) -> str:
    """Read an input file by the day{nn} and file pattern

    For instance:

        > read_input("02", "test-part-one")

    to read the 'inputs/day02/test-part-one.txt" file.
    """
    fpath = INPUT_RESOURCES / day.as_input(filetype)
    with open(fpath, encoding="utf-8") as fobj:
        return fobj.read()
