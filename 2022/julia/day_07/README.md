# Day 7

**No Space Left On Device**

## Part One

Terminal output:

```
$ cd /
$ ls
dir a
14848514 b.txt
8504156 c.dat
dir d
$ cd a
$ ls
dir e
29116 f
2557 g
62596 h.lst
$ cd e
$ ls
584 i
$ cd ..
$ cd ..
$ cd d
$ ls
4060174 j
8033020 d.log
5626152 d.ext
7214296 k
```

> Since the disk is full, your first step should probably be to find directories that
> are good candidates for deletion. To do this, you need to determine the total size
> of each directory. The total size of a directory is the sum of the sizes of the
> files it contains, directly or indirectly. (Directories themselves do not count as
> having any intrinsic size.)

> To begin, find all of the directories with a total size of at most 100000, then
> calculate the sum of their total sizes.

This process can count files more than once!

## Part Two
