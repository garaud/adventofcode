# Advent of Code / 2021 with Julia

[Julia Programming Language](https://julialang.org/)

## Usage

Test with Julia 1.8.x

The code may be splitted into a few `.jl` files.

In order to get the answer for the different parts of a problem to solve, just do:

```
> julia -L part_one.jl -E "main()"
```

There will be always a function `main()` which will return the answer.

## Packages

All programs are not fully "vanilla" Julia programming language. I might add some
packages which are not in the standard library.

Take a look to the `Project.toml` file.

## Run Tests

Sometimes, you can find test files, e.g. `runtests.jl`. To run them, just do:

```
> julia runtests.jl
```

Most of the time, it's a tiny piece of code which uses the example in the problem
description.
