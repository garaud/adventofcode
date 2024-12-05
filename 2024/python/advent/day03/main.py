"""Main module of the day03 package

Day 3: Mull It Over
"""

import re
from dataclasses import dataclass
from enum import StrEnum, auto

from advent import Day, FileType, read_input

DAY = Day("03", part_one="test-part-one.txt", part_two="test-part-two.txt")


@dataclass
class Pair:
    "Just a mere pair of integers"

    left: int
    right: int

    @property
    def compute(self):
        "multiply the two number of the pair"
        return self.left * self.right


class SectionType(StrEnum):
    "Kind of section"

    DONT = auto()
    DO = auto()


@dataclass
class Section:
    """Represent a section of the memory program. Can be tag as "don't" or "do"""

    content: str
    tag: SectionType


def extract_numbers(memory: str) -> list[Pair]:
    """Extract a list of pairs of integers from 'mul(left, right)'"""
    pattern = re.compile(r"mul\((?P<left>\d+),(?P<right>\d+)\)")
    result = pattern.findall(memory)
    return [Pair(int(x), int(y)) for x, y in result]


def extract_dont_sections(memory: str) -> list[str]:
    """Split the memory content into "don't()" sections"""
    return re.split(r"don't\(\)", memory)


def extract_right_sections(memory: str) -> list[Section]:
    """Split the memory content into "do()" sections"""
    sections = re.split(r"do\(\)", memory)
    # first one is DONT, the rest is DO
    result = []
    for idx, content in enumerate(sections):
        if idx == 0:
            result.append(Section(content, tag=SectionType.DONT))
        else:
            result.append(Section(content, tag=SectionType.DO))
    return result


def solve_part_one(ftype: FileType) -> int:
    """solve part one"""
    content = read_input(DAY, ftype)
    pairs = extract_numbers(content)
    return sum(x.compute for x in pairs)


def solve_part_two(ftype: FileType) -> int:
    """solve part two"""
    content = read_input(DAY, ftype)
    first, *rest = extract_dont_sections(content)
    # the first section before the first DONT is correct and can be taken into account.
    first_section = Section(first, tag=SectionType.DO)
    sections = [extract_right_sections(s) for s in rest]
    all_sections = [first_section] + sum(sections, [])  # concatenation + flatten
    # just filter the 'DO' sections
    right_sections = [x for x in all_sections if x.tag == SectionType.DO]
    pairs = sum([extract_numbers(x.content) for x in right_sections], [])
    return sum(x.compute for x in pairs)


if __name__ == "__main__":
    print("# Part one")
    RESULT = solve_part_one(FileType.MAIN)
    print(f"result: {RESULT}")

    print("\n# Part two")
    RESULT = solve_part_two(FileType.MAIN)
    print(f"result: {RESULT}")
