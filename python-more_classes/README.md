# Python - More Classes and Objects

This directory contains solutions for the **Python More Classes and Objects**
project in the `set-high_level_programming` repository.

## Learning objectives

The project covers:

- defining classes and creating objects;
- private instance attributes;
- properties and setters;
- type and value validation;
- instance, class, and static methods;
- `__str__`, `__repr__`, and `__del__`;
- class attributes and instance counters;
- recreating objects with `eval(repr(object))`;
- configurable string representations;
- comparing objects using their computed areas;
- class methods used as alternative constructors;
- recursive backtracking through the N Queens problem.

## Files

| File | Description |
|---|---|
| `0-rectangle.py` | Defines an empty `Rectangle` class. |
| `1-rectangle.py` | Adds validated width and height properties. |
| `2-rectangle.py` | Adds area and perimeter methods. |
| `3-rectangle.py` | Adds a printable string representation. |
| `4-rectangle.py` | Adds an official representation for `eval()`. |
| `5-rectangle.py` | Reports when an instance is deleted. |
| `6-rectangle.py` | Tracks the number of live instances. |
| `7-rectangle.py` | Adds a configurable print symbol. |
| `8-rectangle.py` | Compares rectangles by area. |
| `9-rectangle.py` | Adds a square alternative constructor. |
| `101-nqueens.py` | Prints every solution to the N Queens puzzle. |

## Running individual files

The rectangle files define classes and are intended to be imported by the
project checker.

Run the N Queens solver with:

```bash
./101-nqueens.py 4
```

Expected solutions for `N = 4` include:

```text
[[0, 1], [1, 3], [2, 0], [3, 2]]
[[0, 2], [1, 0], [2, 3], [3, 1]]
```

## N Queens error handling

```bash
./101-nqueens.py
# Usage: nqueens N

./101-nqueens.py four
# N must be a number

./101-nqueens.py 3
# N must be at least 4
```

Each invalid invocation exits with status `1`.

## Style checking

Run:

```bash
python3 -m py_compile ./*.py
pycodestyle ./*.py
```

The project instructions state that no additional test files are required, so
this directory contains only the required solution files and this README.

## Commit the project

From the repository root:

```bash
git add python-more_classes
git commit -m "Complete Python more classes project"
git push
```
