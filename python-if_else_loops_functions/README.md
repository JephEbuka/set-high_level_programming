# Python If/Else, Loops and Functions

This directory contains solutions and local test files for the
`python-if_else_loops_functions` project in the
`set-high_level_programming` repository.

## Required solution files

| Task | File | Description |
|---|---|---|
| 0 | `0-positive_or_negative.py` | Prints whether a random number is positive, zero, or negative |
| 1 | `1-last_digit.py` | Prints the last digit and its required classification |
| 2 | `2-print_alphabet.py` | Prints the lowercase alphabet |
| 3 | `3-print_alphabt.py` | Prints the lowercase alphabet without `q` and `e` |
| 4 | `4-print_hexa.py` | Prints decimal numbers and their hexadecimal forms |
| 5 | `5-print_comb2.py` | Prints numbers from `00` to `99` |
| 6 | `6-print_comb3.py` | Prints unique ascending two-digit combinations |
| 7 | `7-islower.py` | Checks whether a character is lowercase |
| 8 | `8-uppercase.py` | Prints a string in uppercase without using `str.upper()` |
| 9 | `9-print_last_digit.py` | Prints and returns a number's last digit |
| 10 | `10-add.py` | Adds two integers |
| 11 | `11-pow.py` | Raises a number to a power |
| 12 | `12-fizzbuzz.py` | Implements FizzBuzz from 1 to 100 |
| 13 | `13-insert_number.c` | Inserts a node into a sorted singly linked list |
| 13 | `lists.h` | Linked-list structure and prototypes |
| 14 | `100-print_tebahpla.py` | Prints the alphabet backwards with alternating case |
| 15 | `101-remove_char_at.py` | Returns a copy of a string without one indexed character |
| 16 | `102-magic_calculation.py` | Recreates the supplied Python bytecode behavior |

## Included local test files

The following files are included for local testing:

- `7-main.py`
- `8-main.py`
- `9-main.py`
- `10-main.py`
- `11-main.py`
- `12-main.py`
- `13-main.c`
- `linked_lists.c`
- `101-main.py`
- `102-main.py`
- `run_all_tests.sh`

The main files are helpers. The automated checker grades the required solution
files listed in each task.

## Run all local tests

```bash
chmod +x *.py run_all_tests.sh
./run_all_tests.sh
```

The C task is compiled with:

```bash
gcc -Wall -Werror -Wextra -pedantic -std=gnu89 \
    13-main.c linked_lists.c 13-insert_number.c -o insert
```

## Git commands

From the root of the repository:

```bash
git add python-if_else_loops_functions
git commit -m "Complete Python if-else loops and functions project"
git push
```

## Notes

- All executable Python files use a Python 3 shebang.
- The supplied main files are included so each function can be tested locally.
- `run_all_tests.sh` performs Python syntax checks and compiles the C task with
  the required warning flags.
