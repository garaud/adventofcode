# Day 03

**Rucksack Reorganization**

## Part One

> Each rucksack has two large compartments. All items of a given type are meant to go
> into exactly one of the two compartments.

> The Elves have made a list of all of the items currently in each rucksack (your
> puzzle input), but they need your help finding the errors. Every item type is
> identified by a single lowercase or uppercase letter (that is, a and A refer to
> different types of items).

> The list of items for each rucksack is given as characters all on a single line. A given rucksack always has the same number of items in each of its two compartments, so the first half of the characters represent items in the first compartment, while the second half of the characters represent items in the second compartment.

Content from six rucksacks:

```
vJrwpWtwJgWrhcsFMMfFFhFp
jqHRNqRjqzjGDLGLrsFMfFZSrLrFZsSL
PmmdzqPrVvPwwTWBwg
wMqvLMZHhHMvwLHjbvcjnnSBnvTQFn
ttgJtRGJQctTZtZT
CrZsJsPPZsGzwwsLwLmpwMDw
```

To help prioritize item rearrangement, every item type can be converted to a priority:

* Lowercase item types a through z have priorities 1 through 26.
* Uppercase item types A through Z have priorities 27 through 52.
