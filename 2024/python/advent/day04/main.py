"""Main module of the day04 package

Day 4: Ceres Search
"""

import re
from collections.abc import Iterable
from dataclasses import dataclass
from typing import Optional

import numpy as np
import pandas as pd

from advent import Day, FileType, read_input

DAY = Day("04", part_one="test-part-one.txt", part_two="test-part-two.txt")


@dataclass
class WordSearch:
    "WordSearch is a list of lines which contains some letter where XMAS can occur"

    data: pd.DataFrame

    @property
    def iterlines(self) -> Iterable[str]:
        "iter on each lines, forward and backward"
        for idx in range(self.data.shape[0]):
            # forward
            yield "".join(self.data.iloc[idx].values)
            # backward
            yield "".join(reversed(self.data.iloc[idx].values))

    @property
    def itercols(self) -> Iterable[str]:
        "iter on each columns, just forward"
        for icol in self.data:
            # forward
            yield "".join(self.data[icol].values)
            # backward
            yield "".join(reversed(self.data[icol].values))

    @property
    def iterdiags(self) -> Iterable[str]:
        "iter on each diagonal, just forward"
        size = self.data.shape[0]
        for k in range(-size + 2, size - 2):
            yield "".join(np.diag(self.data, k=k))
            yield "".join(reversed(np.diag(self.data, k=k)))
        # from bottom left
        for k in range(-size + 2, size - 2):
            yield "".join(np.diag(self.data.T, k=k))
            yield "".join(reversed(np.diag(self.data.T, k=k)))


@dataclass
class CrossPattern:
    "A cross pattern"

    top_left: Optional[str]
    top_right: Optional[str]
    bottom_left: Optional[str]
    bottom_right: Optional[str]

    @property
    def seq(self):
        "retunrs the four elements of the cross pattern"
        return [self.top_left, self.top_right, self.bottom_left, self.bottom_right]

    @property
    def is_xmas(self) -> bool:
        "is this a X-MAS cross?"
        # we should not have a None
        if any(x is None for x in self.seq):
            return False
        match self.seq:
            case ["M", "M", "S", "S"]:
                return True
            case ["S", "S", "M", "M"]:
                return True
            case ["M", "S", "M", "S"]:
                return True
            case ["S", "M", "S", "M"]:
                return True
            case _:
                return False


def content_to_dataframe(content: str) -> pd.DataFrame:
    """Turn the raw text content to a DataFrame"""
    lines = content.split()
    return pd.DataFrame([list(x) for x in lines])


def count_xmas(seq: str) -> int:
    "Count the number of XMAS occurrence, forward and backward"
    count = seq.count("XMAS")
    return count


def iterate_over_letter_a(seq: str) -> Iterable[int]:
    "Iterate over each letter A to find the X-MAX pattern"
    for match in re.finditer(r"A", seq):
        yield match.start()


def cross(seq: str, *, position: int, size: int) -> CrossPattern:
    "Find letters aroud the position with the X pattern"
    # don't forget to count the '\n' char
    size = size + 1
    top_left = seq[position - size - 1] if (position - size - 1) >= 0 else None
    top_right = seq[position - size + 1] if (position - size + 1) >= 0 else None
    bottom_left = seq[position + size - 1] if (position + size - 1) < len(seq) else None
    bottom_right = seq[position + size + 1] if (position + size + 1) < len(seq) else None
    return CrossPattern(top_left=top_left, top_right=top_right, bottom_left=bottom_left, bottom_right=bottom_right)


def solve_part_one(ftype: FileType) -> int:
    """solve part one"""
    content = read_input(DAY, ftype)
    df = content_to_dataframe(content)
    ws = WordSearch(data=df)
    count_lines = sum(count_xmas(x) for x in ws.iterlines)
    count_cols = sum(count_xmas(x) for x in ws.itercols)
    count_diags = sum(count_xmas(x) for x in ws.iterdiags)
    return count_lines + count_cols + count_diags


def solve_part_two(ftype: FileType) -> int:
    """solve part two"""
    result = 0
    content = read_input(DAY, ftype)
    size = len(content.split())
    for idx in iterate_over_letter_a(content):
        local_cross = cross(content, position=idx, size=size)
        result += local_cross.is_xmas
    return result


if __name__ == "__main__":
    print("# Part one")
    RESULT = solve_part_one(FileType.MAIN)
    print(f"result: {RESULT}")

    print("\n# Part two")
    RESULT = solve_part_two(FileType.MAIN)
    print(f"result: {RESULT}")
