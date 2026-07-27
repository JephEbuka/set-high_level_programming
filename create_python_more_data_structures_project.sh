#!/usr/bin/env bash
set -euo pipefail

PROJECT_DIR="python-more_data_structures"
mkdir -p "$PROJECT_DIR"

cat > "$PROJECT_DIR/0-square_matrix_simple.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Compute the square of every integer in a matrix."""


def square_matrix_simple(matrix=[]):
    """Return a new matrix containing the square of each value."""
    return [[value ** 2 for value in row] for row in matrix]
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/1-search_replace.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Create a list with selected values replaced."""


def search_replace(my_list, search, replace):
    """Return a new list replacing every occurrence of search."""
    return [replace if value == search else value for value in my_list]
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/2-uniq_add.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Add unique integers in a list."""


def uniq_add(my_list=[]):
    """Return the sum of each distinct integer in my_list."""
    return sum(set(my_list))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/3-common_elements.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Find elements shared by two sets."""


def common_elements(set_1, set_2):
    """Return the intersection of set_1 and set_2."""
    return set_1 & set_2
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/4-only_diff_elements.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Find elements present in exactly one of two sets."""


def only_diff_elements(set_1, set_2):
    """Return the symmetric difference of set_1 and set_2."""
    return set_1 ^ set_2
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/5-number_keys.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Count dictionary keys."""


def number_keys(a_dictionary):
    """Return the number of keys in a_dictionary."""
    return len(a_dictionary)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/6-print_sorted_dictionary.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Print a dictionary in key order."""


def print_sorted_dictionary(a_dictionary):
    """Print first-level dictionary entries sorted by key."""
    for key in sorted(a_dictionary):
        print("{}: {}".format(key, a_dictionary[key]))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/7-update_dictionary.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Update or add an entry in a dictionary."""


def update_dictionary(a_dictionary, key, value):
    """Set key to value in a_dictionary and return the dictionary."""
    a_dictionary[key] = value
    return a_dictionary
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/8-simple_delete.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Delete a dictionary key when it exists."""


def simple_delete(a_dictionary, key=""):
    """Remove key from a_dictionary and return the dictionary."""
    if key in a_dictionary:
        del a_dictionary[key]
    return a_dictionary
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/9-multiply_by_2.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Multiply dictionary values by two."""


def multiply_by_2(a_dictionary):
    """Return a new dictionary with each integer value doubled."""
    return {key: value * 2 for key, value in a_dictionary.items()}
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/10-best_score.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Find the key with the highest integer value."""


def best_score(a_dictionary):
    """Return the key with the greatest score, or None if unavailable."""
    if not a_dictionary:
        return None
    return max(a_dictionary, key=a_dictionary.get)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/11-multiply_list_map.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
def multiply_list_map(my_list=[], number=0):
    return list(map(lambda value: value * number, my_list))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/12-roman_to_int.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Convert Roman numerals to integers."""


def roman_to_int(roman_string):
    """Return the integer represented by roman_string, or 0 if invalid type."""
    if not isinstance(roman_string, str) or not roman_string:
        return 0

    values = {'I': 1, 'V': 5, 'X': 10, 'L': 50,
              'C': 100, 'D': 500, 'M': 1000}
    total = 0
    previous = 0

    for character in reversed(roman_string):
        current = values.get(character, 0)
        if current < previous:
            total -= current
        else:
            total += current
            previous = current

    return total
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/100-weight_average.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Calculate a weighted average."""


def weight_average(my_list=[]):
    """Return the weighted average of score-weight tuples."""
    if not my_list:
        return 0

    weighted_total = sum(score * weight for score, weight in my_list)
    total_weight = sum(weight for _, weight in my_list)
    return weighted_total / total_weight if total_weight else 0
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/101-square_matrix_map.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
def square_matrix_map(matrix=[]):
    return list(map(lambda row: list(map(lambda value: value ** 2, row)), matrix))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/102-complex_delete.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Delete dictionary entries by value."""


def complex_delete(a_dictionary, value):
    """Delete every key whose value equals value and return the dictionary."""
    for key in list(a_dictionary.keys()):
        if a_dictionary[key] == value:
            del a_dictionary[key]
    return a_dictionary
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/103-python.c" <<'FILE_CONTENT_EOF'
#include <stdio.h>
#include <Python.h>

/**
 * print_python_bytes - prints information about a Python bytes object
 * @p: pointer to the Python object
 */
void print_python_bytes(PyObject *p)
{
	PyBytesObject *bytes;
	Py_ssize_t size;
	Py_ssize_t count;
	Py_ssize_t i;

	printf("[.] bytes object info\n");
	if (p == NULL || p->ob_type != &PyBytes_Type)
	{
		printf("  [ERROR] Invalid Bytes Object\n");
		fflush(stdout);
		return;
	}

	bytes = (PyBytesObject *)p;
	size = bytes->ob_base.ob_size;
	count = size + 1;
	if (count > 10)
		count = 10;

	printf("  size: %ld\n", (long)size);
	printf("  trying string: %s\n", bytes->ob_sval);
	printf("  first %ld bytes:", (long)count);
	for (i = 0; i < count; i++)
		printf(" %02x", (unsigned char)bytes->ob_sval[i]);
	printf("\n");
	fflush(stdout);
}

/**
 * print_python_list - prints information about a Python list object
 * @p: pointer to the Python list
 */
void print_python_list(PyObject *p)
{
	PyListObject *list;
	Py_ssize_t size;
	Py_ssize_t i;
	PyObject *item;

	list = (PyListObject *)p;
	size = list->ob_base.ob_size;

	printf("[*] Python list info\n");
	printf("[*] Size of the Python List = %ld\n", (long)size);
	printf("[*] Allocated = %ld\n", (long)list->allocated);

	for (i = 0; i < size; i++)
	{
		item = list->ob_item[i];
		printf("Element %ld: %s\n", (long)i, item->ob_type->tp_name);
		if (item->ob_type == &PyBytes_Type)
			print_python_bytes(item);
	}
	fflush(stdout);
}
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/0-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
square_matrix_simple = __import__('0-square_matrix_simple').square_matrix_simple

matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

new_matrix = square_matrix_simple(matrix)
print(new_matrix)
print(matrix)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/1-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
search_replace = __import__('1-search_replace').search_replace

my_list = [1, 2, 3, 4, 5, 4, 2, 1, 1, 4, 89]
new_list = search_replace(my_list, 2, 89)

print(new_list)
print(my_list)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/2-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
uniq_add = __import__('2-uniq_add').uniq_add

my_list = [1, 2, 3, 1, 4, 2, 5]
result = uniq_add(my_list)
print("Result: {:d}".format(result))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/3-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
common_elements = __import__('3-common_elements').common_elements

set_1 = {"Python", "C", "Javascript"}
set_2 = {"Bash", "C", "Ruby", "Perl"}
c_set = common_elements(set_1, set_2)
print(sorted(list(c_set)))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/4-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
only_diff_elements = __import__('4-only_diff_elements').only_diff_elements

set_1 = {"Python", "C", "Javascript"}
set_2 = {"Bash", "C", "Ruby", "Perl"}
od_set = only_diff_elements(set_1, set_2)
print(sorted(list(od_set)))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/5-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
number_keys = __import__('5-number_keys').number_keys

a_dictionary = {'language': "C", 'number': 13, 'track': "Low level"}
nb_keys = number_keys(a_dictionary)
print("Number of keys: {:d}".format(nb_keys))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/6-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
print_sorted_dictionary = __import__('6-print_sorted_dictionary').print_sorted_dictionary

a_dictionary = {'language': "C", 'Number': 89,
                'track': "Low level", 'ids': [1, 2, 3]}
print_sorted_dictionary(a_dictionary)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/7-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
update_dictionary = __import__('7-update_dictionary').update_dictionary
print_sorted_dictionary = __import__('6-print_sorted_dictionary').print_sorted_dictionary

a_dictionary = {'language': "C", 'number': 89, 'track': "Low level"}
new_dict = update_dictionary(a_dictionary, 'language', "Python")
print_sorted_dictionary(new_dict)
print("--")
print_sorted_dictionary(a_dictionary)

print("--")
print("--")

new_dict = update_dictionary(a_dictionary, 'city', "San Francisco")
print_sorted_dictionary(new_dict)
print("--")
print_sorted_dictionary(a_dictionary)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/8-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
simple_delete = __import__('8-simple_delete').simple_delete
print_sorted_dictionary = \
    __import__('6-print_sorted_dictionary').print_sorted_dictionary

a_dictionary = {'language': "C", 'Number': 89,
                'track': "Low", 'ids': [1, 2, 3]}
new_dict = simple_delete(a_dictionary, 'track')
print_sorted_dictionary(a_dictionary)
print("--")
print_sorted_dictionary(new_dict)

print("--")
print("--")
new_dict = simple_delete(a_dictionary, 'c_is_fun')
print_sorted_dictionary(a_dictionary)
print("--")
print_sorted_dictionary(new_dict)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/9-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
multiply_by_2 = __import__('9-multiply_by_2').multiply_by_2
print_sorted_dictionary = \
    __import__('6-print_sorted_dictionary').print_sorted_dictionary

a_dictionary = {'John': 12, 'Alex': 8, 'Bob': 14,
                'Mike': 14, 'Molly': 16}
new_dict = multiply_by_2(a_dictionary)
print_sorted_dictionary(a_dictionary)
print("--")
print_sorted_dictionary(new_dict)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/10-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
best_score = __import__('10-best_score').best_score

a_dictionary = {'John': 12, 'Bob': 14, 'Mike': 14,
                'Molly': 16, 'Adam': 10}
best_key = best_score(a_dictionary)
print("Best score: {}".format(best_key))

best_key = best_score(None)
print("Best score: {}".format(best_key))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/11-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
multiply_list_map = __import__('11-multiply_list_map').multiply_list_map

my_list = [1, 2, 3, 4, 6]
new_list = multiply_list_map(my_list, 4)
print(new_list)
print(my_list)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/12-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
"""Roman to Integer test file."""
roman_to_int = __import__('12-roman_to_int').roman_to_int

roman_number = "X"
print("{} = {}".format(roman_number, roman_to_int(roman_number)))

roman_number = "VII"
print("{} = {}".format(roman_number, roman_to_int(roman_number)))

roman_number = "IX"
print("{} = {}".format(roman_number, roman_to_int(roman_number)))

roman_number = "LXXXVII"
print("{} = {}".format(roman_number, roman_to_int(roman_number)))

roman_number = "DCCVII"
print("{} = {}".format(roman_number, roman_to_int(roman_number)))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/100-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
weight_average = __import__('100-weight_average').weight_average

my_list = [(1, 2), (2, 1), (3, 10), (4, 2)]
result = weight_average(my_list)
print("Average: {:0.2f}".format(result))
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/101-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
square_matrix_map = \
    __import__('101-square_matrix_map').square_matrix_map

matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

new_matrix = square_matrix_map(matrix)
print(new_matrix)
print(matrix)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/102-main.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
complex_delete = __import__('102-complex_delete').complex_delete
print_sorted_dictionary = \
    __import__('6-print_sorted_dictionary').print_sorted_dictionary

a_dictionary = {'lang': "C", 'track': "Low",
                'pref': "C", 'ids': [1, 2, 3]}
new_dict = complex_delete(a_dictionary, 'C')
print_sorted_dictionary(a_dictionary)
print("--")
print_sorted_dictionary(new_dict)

print("--")
print("--")
new_dict = complex_delete(a_dictionary, 'c_is_fun')
print_sorted_dictionary(a_dictionary)
print("--")
print_sorted_dictionary(new_dict)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/103-tests.py" <<'FILE_CONTENT_EOF'
#!/usr/bin/python3
import ctypes

lib = ctypes.CDLL('./libPython.so')
lib.print_python_list.argtypes = [ctypes.py_object]
lib.print_python_bytes.argtypes = [ctypes.py_object]

s = b"Hello"
lib.print_python_bytes(s)
b = b'\xff\xf8\x00\x00\x00\x00\x00\x00'
lib.print_python_bytes(b)
b = b"What does the 'b' character do in front of a string literal?"
lib.print_python_bytes(b)
l = [b'Hello', b'World']
lib.print_python_list(l)
del l[1]
lib.print_python_list(l)
l = l + [4, 5, 6.0, (9, 8), [9, 8, 1024], b"ALX", "Betty"]
lib.print_python_list(l)
l = []
lib.print_python_list(l)
l.append(0)
lib.print_python_list(l)
l.append(1)
l.append(2)
l.append(3)
l.append(4)
lib.print_python_list(l)
l.pop()
lib.print_python_list(l)
l = ["ALX"]
lib.print_python_list(l)
lib.print_python_bytes(l)
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/run_all_tests.sh" <<'FILE_CONTENT_EOF'
#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

printf 'Running Python syntax checks...\n'
python3 -m py_compile \
  0-square_matrix_simple.py \
  1-search_replace.py \
  2-uniq_add.py \
  3-common_elements.py \
  4-only_diff_elements.py \
  5-number_keys.py \
  6-print_sorted_dictionary.py \
  7-update_dictionary.py \
  8-simple_delete.py \
  9-multiply_by_2.py \
  10-best_score.py \
  11-multiply_list_map.py \
  12-roman_to_int.py \
  100-weight_average.py \
  101-square_matrix_map.py \
  102-complex_delete.py

printf 'Checking three-line task limits...\n'
[ "$(wc -l < 11-multiply_list_map.py)" -le 3 ]
[ "$(wc -l < 101-square_matrix_map.py)" -le 3 ]

printf 'Running supplied Python main files...\n'
for test_file in \
  0-main.py 1-main.py 2-main.py 3-main.py 4-main.py 5-main.py \
  6-main.py 7-main.py 8-main.py 9-main.py 10-main.py 11-main.py \
  12-main.py 100-main.py 101-main.py 102-main.py
do
  printf '\n===== %s =====\n' "$test_file"
  python3 "$test_file"
done

if command -v gcc >/dev/null 2>&1 && command -v python3-config >/dev/null 2>&1; then
  printf '\nCompiling CPython inspection library with local Python headers...\n'
  gcc -Wall -Werror -Wextra -pedantic -std=c99 -shared \
    -Wl,-soname,libPython.so -o libPython.so -fPIC \
    $(python3-config --includes) 103-python.c

  printf 'Running 103-tests.py against the local Python version...\n'
  python3 103-tests.py
else
  printf '\nSkipping task 16 compilation: gcc or python3-config is unavailable.\n'
fi

printf '\nAll available tests completed successfully.\n'
FILE_CONTENT_EOF

cat > "$PROJECT_DIR/README.md" <<'FILE_CONTENT_EOF'
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
FILE_CONTENT_EOF

chmod +x "$PROJECT_DIR"/*.py "$PROJECT_DIR"/run_all_tests.sh
printf "Created %s with solutions, tests, and README.\n" "$PROJECT_DIR"