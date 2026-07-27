# Python More Data Structures

This directory contains solutions and local test files for the Python project on sets, dictionaries, `map`, matrices, Roman numerals, weighted averages, and CPython object internals.

## Repository

- **GitHub repository:** `set-high_level_programming`
- **Directory:** `python-more_data_structures`

## Files

| File | Description |
|---|---|
| `0-square_matrix_simple.py` | Returns a new matrix with every value squared. |
| `1-search_replace.py` | Replaces matching values in a new list. |
| `2-uniq_add.py` | Adds every unique integer once. |
| `3-common_elements.py` | Returns the intersection of two sets. |
| `4-only_diff_elements.py` | Returns the symmetric difference of two sets. |
| `5-number_keys.py` | Counts dictionary keys. |
| `6-print_sorted_dictionary.py` | Prints first-level dictionary entries in key order. |
| `7-update_dictionary.py` | Adds or updates a dictionary entry. |
| `8-simple_delete.py` | Deletes a dictionary key when present. |
| `9-multiply_by_2.py` | Returns a new dictionary with doubled values. |
| `10-best_score.py` | Returns the key with the greatest integer value. |
| `11-multiply_list_map.py` | Multiplies list values using `map`, with no loops. |
| `12-roman_to_int.py` | Converts a Roman numeral to an integer. |
| `100-weight_average.py` | Calculates a weighted average. |
| `101-square_matrix_map.py` | Squares a matrix using nested `map` calls. |
| `102-complex_delete.py` | Deletes every dictionary key matching a value. |
| `103-python.c` | Prints internal information about Python list and bytes objects. |

The supplied `*-main.py` files and `103-tests.py` are included for local testing. They are useful while developing, although an automated checker normally grades only the filenames listed by each task.

## Run all tests

```bash
chmod +x run_all_tests.sh
./run_all_tests.sh
```

The test runner:

1. Compiles all Python files with `py_compile`.
2. Confirms the two three-line tasks stay within their limits.
3. Runs every supplied Python main file.
4. Compiles `103-python.c` as a shared library when `gcc` and `python3-config` are available.
5. Runs `103-tests.py` against the locally installed Python version.

## Task 16 compatibility note

The original task targets **CPython 3.4** and uses this compilation command:

```bash
gcc -Wall -Werror -Wextra -pedantic -std=c99 -shared \
  -Wl,-soname,libPython.so -o libPython.so -fPIC \
  -I/usr/include/python3.4 103-python.c
```

Modern Python versions may report different list allocation sizes because those are implementation details. The field access in `103-python.c` avoids the prohibited macros and functions listed in the task.

The task text supplied for the `b"ALX"` example also shows hexadecimal bytes corresponding to a different string. This implementation reports the bytes contained in the actual object rather than reproducing that inconsistent sample line.

## Commit the project

From the repository root:

```bash
git add python-more_data_structures
git commit -m "Complete Python more data structures project"
git push
```
