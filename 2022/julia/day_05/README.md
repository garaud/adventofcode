# Day 05

**Supply Stacks**

## Part One

Crates from the cargo need to be rearranged.

> The ship has a giant cargo crane capable of moving crates between stacks. To ensure
> none of the crates get crushed or fall over, the crane operator will rearrange them
> in a series of carefully-planned steps. After the crates are rearranged, the
> desired crates will be at the top of each stack.

```
    [D]
[N] [C]
[Z] [M] [P]
 1   2   3

move 1 from 2 to 1
move 3 from 1 to 3
move 2 from 2 to 1
move 1 from 1 to 2
```

The Elves just need to know which crate will end up on top of each stack
