# Day 04

**Giant Squid**

A squid wants to play Bingo!


## Part one

`5x5` grids.

If all numbers in any row or any column of a board are marked, that board wins. (Diagonals don't count.)

> The submarine has a bingo subsystem to help passengers (currently, you and the
> giant squid) pass the time. It automatically generates a random order in which to
> draw numbers and a random set of boards (your puzzle input). For example:

```
7,4,9,5,11,17,23,2,0,14,21,24,10,16,13,6,15,25,12,22,18,20,8,19,3,26,1

22 13 17 11  0
 8  2 23  4 24
21  9 14 16  7
 6 10  3 18  5
 1 12 20 15 19

 3 15  0  2 22
 9 18 13 17  5
19  8  7 25 23
20 11 10 24  4
14 21 16 12  6

14 21 17 24  4
10 16 15  9 19
18  8 23 26 20
22 11 13  6  5
 2  0 12  3  7
```

The score of the winning board can now be calculated. Start by finding the sum of all
unmarked numbers on that board. Then, multiply that sum by the number that was just
called when the board won.

## Part Two

> On the other hand, it might be wise to try a different strategy: let the giant
> squid win.

> [...] the safe thing to do is to figure out which board will win last and choose
> that one.
