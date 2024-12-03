"""Main module of the day01 package

Day 01 - Historian Hysteria
"""

from collections import Counter

from advent import Day, FileType, read_input

DAY = Day("01", part_one="test-part.txt", part_two="test-part.txt")


def split_content(content: str) -> tuple[list[int], list[int]]:
    """Split the main input content into two lists."""
    full_list = [x.strip() for x in content.split()]
    first = [int(x) for x in full_list[0::2]]
    second = [int(x) for x in full_list[1::2]]
    return first, second


def solve_part_one(ftype: FileType) -> int:
    """solve part one

    Sort the two lists in order to always get the smallest one from the first list
    with the smallest one from the 2nd list.

    Then compute the distance and sum it.
    """
    content = read_input(DAY, ftype)
    # split the content into two lists
    first, second = split_content(content)
    # need to sort the list
    first.sort()
    second.sort()
    distance = [abs(left - right) for left, right in zip(first, second)]
    return sum(distance)


def solve_part_two(ftype: FileType) -> int:
    """solve part two

    Compute the occurrence of each int in the 2nd list.

    Just multiply the number from the first one with the number of times
    it occurrs in the 2nd one (this is the similarity).
    """
    content = read_input(DAY, ftype)
    # split the content into two lists
    first, second = split_content(content)
    occurrences = Counter(second)
    similarity = [x * occurrences[x] for x in first]
    return sum(similarity)


if __name__ == "__main__":
    print("# Part one")
    RESULT = solve_part_one(FileType.MAIN)
    print(f"result: {RESULT}")

    print("\n# Part two")
    RESULT = solve_part_two(FileType.MAIN)
    print(f"result: {RESULT}")
