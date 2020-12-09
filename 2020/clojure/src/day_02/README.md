# Day 02

Password policy.

According to the `input` file.

## Part One

Find the number of wrong passwords. The input format looks like:

    2-4 c: bchtgc

The letter `c` must be in the password between 2 or 4 times.

Launch with `clj -X day-02.part-one/run`.

## Part Two

Previous policy has been changed!

    2-4 c: bchtgc

means that 2 and 4 are positions of the given letter in the password. Exactly one of
these positions must contain the given letter.

Launch with `clj -X day-02.part-two/run`.
