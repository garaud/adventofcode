# Advent of Code 2023

A try (after a few months of delay) to solve some problems with the [Elixir](https://elixir-lang.org/) programming language.

https://adventofcode.com/2023/

REPL:

```
iex -S mix
```

## Run

You can run the test files with the `mix test` command.

And you can run the main solving program for a specific day:

`mix run -e 'Advent.Day01.main()'` for the day 01 for instance, should print the result.

## Run Tests

Just do:

```
mix test
```

or

```
mix test --include "Day01"
```

if you just want to run a test case for a specific advent of code day.


## Run a linter

[credo](https://github.com/rrrene/credo) is a static code analysis tool.

Just:

```
mix credo
```
