# Python - Data Structures: Lists and Tuples

This directory contains the complete **Python Data Structures** project for the
`set-high_level_programming` repository.

## Learning objectives

The exercises cover:

- iterating through lists and matrices;
- safe index access and in-place list updates;
- copying lists without modifying the original;
- tuple operations and multiple return values;
- filtering strings and testing divisibility;
- deleting list items without `pop()`;
- checking a singly linked list for a palindrome in C;
- inspecting Python list internals through CPython's C API.

## Required solution files

| File | Purpose |
|---|---|
| `0-print_list_integer.py` | Prints every integer in a list. |
| `1-element_at.py` | Safely retrieves an element by C-style index. |
| `2-replace_in_list.py` | Replaces an element in the original list. |
| `3-print_reversed_list_integer.py` | Prints list integers in reverse order. |
| `4-new_in_list.py` | Replaces an element in a copied list. |
| `5-no_c.py` | Removes every `c` and `C` from a string. |
| `6-print_matrix_integer.py` | Prints a matrix of integers. |
| `7-add_tuple.py` | Adds the first two entries of two tuples. |
| `8-multiple_returns.py` | Returns a string's length and first character. |
| `9-max_integer.py` | Finds the largest list integer without `max()`. |
| `10-divisible_by_2.py` | Returns divisibility-by-two results. |
| `11-delete_at.py` | Deletes a list item without `pop()`. |
| `12-switch.py` | Swaps two variables in exactly five lines. |
| `13-is_palindrome.c` | Checks a linked list palindrome in O(n) time and O(1) extra space. |
| `lists.h` | Linked-list declarations. |
| `100-print_python_list_info.c` | Prints CPython list size, capacity, and element types. |

## Included test files

All sample main files are included, together with:

- `13-main.c`
- `linked_lists.c`
- `100-test_lists.py`
- `run_all_tests.sh`

## Testing

```bash
chmod +x run_all_tests.sh
./run_all_tests.sh
```

The test runner checks Python syntax, expected outputs, the five-line limit for
`12-switch.py`, and the linked-list C implementation with strict warnings.

The CPython extension is compiled against the Python development headers installed
on the current machine. The official checker targets Python 3.4, so internal list
allocation numbers may differ on newer Python versions even when the implementation
is correct.

## Commit

From the repository root:

```bash
git add python-data_structures
git commit -m "Complete Python data structures project"
git push
```
