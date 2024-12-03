# Advent of Code 2024 (Python)

Solve some problems with the [Python](https://www.python.org/) programming language.

https://adventofcode.com/2024/

REPL:

```
ipython
```

Using Python 3.13


## Run

Install the dependencies with [poetry](https://python-poetry.org/)

`poetry install`.

Then, just find the day to solve.

e.g. `python advent/day03/main.py`. The results will be print in the standard output.


You can run the formatting, linting and testing with a single command: `just`. Using the [just command runner](https://github.com/casey/just). See also the `justfile`.

## Run Tests

`poetry run pytest`


## Run a linter & formatter

I use [ruff](https://github.com/astral-sh/ruff)

* `poetry run ruff format`
* `poetry run ruff check


## Run mypy

`mypy --namespace-package advent tests`
