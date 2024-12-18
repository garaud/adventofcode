# Day 05

Binary Boarding.

## Part One

Airline uses binary space partitioning to seat people. A seat might be specified like
FBFBBFFRLR, where F means "front", B means "back", L means "left", and R means
"right".

Every seat also has a unique seat ID: multiply the row by 8, then add the column.

Launch with `clj -X day-05.part-one/run`.

## Part Two

Find the seat id.

The seat wasn't at the very front or back, though; the seats with IDs +1 and -1 from
yours will be in your list.

Launch with `clj -X day-05.part-two/run`.
