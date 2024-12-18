# Advent of Code 2024 (Python)

Solve some problems with the [Python](https://www.python.org/) programming language.

https://adventofcode.com/2024/

REPL:

```
ipython
```

Using Python 3.11, 3.12 or 3.13


## Run

Install the dependencies with [poetry](https://python-poetry.org/)

`poetry install`.

Then, just find the day to solve. Don't forget to `poetry shell` to swith with the correct virtualenv created by poetry.

e.g. `python advent/day03/main.py`. The results will be print in the standard output.


You can run the formatting, linting and testing with a single command: `just`. Using the [just command
runner](https://github.com/casey/just). See also the `justfile`.

Example of outputs of `just`:

```
echo Linting
Linting
ruff format
5 files left unchanged
ruff check
All checks passed!
mypy --namespace-package advent tests
Success: no issues found in 5 source files
echo Testing
Testing
pytest -s tests
============================================== test session starts ===============================================
platform darwin -- Python 3.11.10, pytest-7.3.2, pluggy-0.13.1
rootdir: adventofcode/2024/python
plugins: anyio-4.6.2.post1
collected 2 items

tests/test_day01.py ..
...
```

## Run Tests

`poetry run pytest`


## Run a linter & formatter

I use [ruff](https://github.com/astral-sh/ruff)

* `poetry run ruff format`
* `poetry run ruff check`


## Run mypy

`mypy --namespace-package advent tests`
