"""Main module of the day02 package

Day 02 - Red-Nosed Reports
"""

import itertools
from dataclasses import dataclass

import numpy as np
import numpy.typing as npt

from advent import Day, FileType, read_input

DAY = Day("02", part_one="test-part.txt", part_two="test-part.txt")


# type alias with NDarray of int
ReportContent = npt.NDArray[np.int_]


@dataclass
class Report:
    """A report which is an array of integers"""

    digits: ReportContent

    @property
    def size(self) -> int:
        "Size of the report"
        return self.digits.shape[0]

    @property
    def is_safe(self) -> bool:
        "Is the Report safe?"
        return is_monotonic(self.digits) and check_adjacent_levels(self.digits)


def is_monotonic(digits: ReportContent) -> bool:
    """Is monotonic?

    Compute the diff (next - previous) and check if all numbers are strictly negative or positive.
    """
    diff = np.diff(digits)
    return bool(np.all(diff > 0) or np.all(diff < 0))


def check_adjacent_levels(digits: ReportContent) -> bool:
    """Check if the diff is lower or equal to 3"""
    diff = np.diff(digits)
    return all(np.abs(diff) <= 3)


def skip_digits_in_report(report: Report) -> list[Report]:
    """Skip one digit for each digit in a report"""
    indices = [np.array(x) for x in itertools.combinations(range(report.size), report.size - 1)]
    return [Report(report.digits[idx]) for idx in indices]


def at_least_one_report_safe_with_tolerance(report: Report) -> bool:
    """Return True if at least one report "minus one digit" based on `report` is safe."""
    return any(subreport.is_safe for subreport in skip_digits_in_report(report))


def extract_reports_list(content: str) -> list[Report]:
    """Retrieve all Reports"""

    def str2report(line):
        return np.array([int(x) for x in line.split()])

    return [Report(digits=str2report(line)) for line in content.split("\n") if line.strip()]


def solve_part_one(ftype: FileType) -> int:
    """solve part one"""
    content = read_input(DAY, ftype)
    reports = extract_reports_list(content)
    safe_report = [report for report in reports if report.is_safe]
    return len(safe_report)


def solve_part_two(ftype: FileType) -> int:
    """solve part two"""
    content = read_input(DAY, ftype)
    reports = extract_reports_list(content)
    safe_report = [report for report in reports if at_least_one_report_safe_with_tolerance(report)]
    return len(safe_report)


if __name__ == "__main__":
    print("# Part one")
    RESULT = solve_part_one(FileType.MAIN)
    print(f"result: {RESULT}")

    print("\n# Part two")
    RESULT = solve_part_two(FileType.MAIN)
    print(f"result: {RESULT}")
