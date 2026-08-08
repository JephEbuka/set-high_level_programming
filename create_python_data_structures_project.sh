#!/usr/bin/env bash
set -eu
TARGET="python-data_structures"
rm -rf "$TARGET"
mkdir -p "$TARGET"
cat > "$TARGET/0-main.py" <<'EOF_4F93CD30D4D2'
#!/usr/bin/python3
print_list_integer = __import__('0-print_list_integer').print_list_integer

my_list = [1, 2, 3, 4, 5]
print_list_integer(my_list)
EOF_4F93CD30D4D2
cat > "$TARGET/0-print_list_integer.py" <<'EOF_4F160EAC7CF9'
#!/usr/bin/python3
def print_list_integer(my_list=[]):
    """Print each integer in a list on its own line."""
    for number in my_list:
        print("{:d}".format(number))
EOF_4F160EAC7CF9
cat > "$TARGET/1-element_at.py" <<'EOF_93D23568EDBF'
#!/usr/bin/python3
def element_at(my_list, idx):
    """Return the element at idx, or None for an invalid index."""
    if idx < 0 or idx >= len(my_list):
        return None
    return my_list[idx]
EOF_93D23568EDBF
cat > "$TARGET/1-main.py" <<'EOF_0D7817468608'
#!/usr/bin/python3
element_at = __import__('1-element_at').element_at

my_list = [1, 2, 3, 4, 5]
idx = 3
print("Element at index {:d} is {}".format(idx, element_at(my_list, idx)))
EOF_0D7817468608
cat > "$TARGET/10-divisible_by_2.py" <<'EOF_1FF4DD69583E'
#!/usr/bin/python3
def divisible_by_2(my_list=[]):
    """Return whether each number in a list is divisible by two."""
    return [number % 2 == 0 for number in my_list]
EOF_1FF4DD69583E
cat > "$TARGET/10-main.py" <<'EOF_04D95AD6802F'
#!/usr/bin/python3
divisible_by_2 = __import__('10-divisible_by_2').divisible_by_2

my_list = [0, 1, 2, 3, 4, 5, 6]
list_result = divisible_by_2(my_list)

i = 0
while i < len(list_result):
    print("{:d} {:s} divisible by 2".format(
        my_list[i], "is" if list_result[i] else "is not"))
    i += 1
EOF_04D95AD6802F
cat > "$TARGET/100-print_python_list_info.c" <<'EOF_7AD02CB972F6'
#include <Python.h>
#include <stdio.h>

/**
 * print_python_list_info - prints basic information about a Python list
 * @p: Python list object
 */
void print_python_list_info(PyObject *p)
{
	PyListObject *list;
	Py_ssize_t index, size;

	list = (PyListObject *)p;
	size = PyList_Size(p);
	printf("[*] Size of the Python List = %ld\n", (long)size);
	printf("[*] Allocated = %ld\n", (long)list->allocated);

	for (index = 0; index < size; index++)
		printf("Element %ld: %s\n", (long)index,
		       Py_TYPE(list->ob_item[index])->tp_name);
}
EOF_7AD02CB972F6
cat > "$TARGET/100-test_lists.py" <<'EOF_7D52ECBD97AB'
#!/usr/bin/python3
import ctypes

lib = ctypes.CDLL('./libPyList.so')
lib.print_python_list_info.argtypes = [ctypes.py_object]
l = ['hello', 'World']
lib.print_python_list_info(l)
del l[1]
lib.print_python_list_info(l)
l = l + [4, 5, 6.0, (9, 8), [9, 8, 1024], "My string"]
lib.print_python_list_info(l)
l = []
lib.print_python_list_info(l)
l.append(0)
lib.print_python_list_info(l)
l.append(1)
l.append(2)
l.append(3)
l.append(4)
lib.print_python_list_info(l)
l.pop()
lib.print_python_list_info(l)
EOF_7D52ECBD97AB
cat > "$TARGET/11-delete_at.py" <<'EOF_04CFFF56D404'
#!/usr/bin/python3
def delete_at(my_list=[], idx=0):
    """Delete the element at idx when the index is valid."""
    if 0 <= idx < len(my_list):
        del my_list[idx]
    return my_list
EOF_04CFFF56D404
cat > "$TARGET/11-main.py" <<'EOF_4BDDD65A4615'
#!/usr/bin/python3
delete_at = __import__('11-delete_at').delete_at

my_list = [1, 2, 3, 4, 5]
idx = 3
new_list = delete_at(my_list, idx)
print(new_list)
print(my_list)
EOF_4BDDD65A4615
cat > "$TARGET/12-switch.py" <<'EOF_28ED59418F2C'
#!/usr/bin/python3
a = 89
b = 10
a, b = b, a
print("a={:d} - b={:d}".format(a, b))
EOF_28ED59418F2C
cat > "$TARGET/13-is_palindrome.c" <<'EOF_F2371C835FF4'
#include "lists.h"

/**
 * reverse_list - reverses a singly linked list
 * @head: head of the list to reverse
 *
 * Return: new head of the reversed list
 */
static listint_t *reverse_list(listint_t *head)
{
	listint_t *previous = NULL;
	listint_t *next;

	while (head != NULL)
	{
		next = head->next;
		head->next = previous;
		previous = head;
		head = next;
	}

	return (previous);
}

/**
 * is_palindrome - checks whether a singly linked list is a palindrome
 * @head: address of the list head pointer
 *
 * Return: 1 if the list is a palindrome, otherwise 0
 */
int is_palindrome(listint_t **head)
{
	listint_t *slow, *fast, *second_half, *current, *first;
	int result = 1;

	if (head == NULL || *head == NULL || (*head)->next == NULL)
		return (1);

	slow = *head;
	fast = *head;
	while (fast->next != NULL && fast->next->next != NULL)
	{
		slow = slow->next;
		fast = fast->next->next;
	}

	second_half = reverse_list(slow->next);
	slow->next = second_half;
	current = second_half;
	first = *head;

	while (current != NULL)
	{
		if (first->n != current->n)
		{
			result = 0;
			break;
		}
		first = first->next;
		current = current->next;
	}

	slow->next = reverse_list(second_half);
	return (result);
}
EOF_F2371C835FF4
cat > "$TARGET/13-main.c" <<'EOF_2EEBD6A0CB37'
#include <stdio.h>
#include <stdlib.h>
#include "lists.h"

/**
 * main - checks is_palindrome
 *
 * Return: always 0
 */
int main(void)
{
	listint_t *head;

	head = NULL;
	add_nodeint_end(&head, 1);
	add_nodeint_end(&head, 17);
	add_nodeint_end(&head, 972);
	add_nodeint_end(&head, 50);
	add_nodeint_end(&head, 98);
	add_nodeint_end(&head, 98);
	add_nodeint_end(&head, 50);
	add_nodeint_end(&head, 972);
	add_nodeint_end(&head, 17);
	add_nodeint_end(&head, 1);
	print_listint(head);

	if (is_palindrome(&head) == 1)
		printf("Linked list is a palindrome\n");
	else
		printf("Linked list is not a palindrome\n");

	free_listint(head);
	return (0);
}
EOF_2EEBD6A0CB37
cat > "$TARGET/2-main.py" <<'EOF_23EB8BFBA8B4'
#!/usr/bin/python3
replace_in_list = __import__('2-replace_in_list').replace_in_list

my_list = [1, 2, 3, 4, 5]
idx = 3
new_element = 9
new_list = replace_in_list(my_list, idx, new_element)

print(new_list)
print(my_list)
EOF_23EB8BFBA8B4
cat > "$TARGET/2-replace_in_list.py" <<'EOF_3B3D2FDD9995'
#!/usr/bin/python3
def replace_in_list(my_list, idx, element):
    """Replace an element at idx when the index is valid."""
    if 0 <= idx < len(my_list):
        my_list[idx] = element
    return my_list
EOF_3B3D2FDD9995
cat > "$TARGET/3-main.py" <<'EOF_2C8F87D8D63E'
#!/usr/bin/python3
print_reversed_list_integer =     __import__('3-print_reversed_list_integer').print_reversed_list_integer

my_list = [1, 2, 3, 4, 5]
print_reversed_list_integer(my_list)
EOF_2C8F87D8D63E
cat > "$TARGET/3-print_reversed_list_integer.py" <<'EOF_E3F0789C82C6'
#!/usr/bin/python3
def print_reversed_list_integer(my_list=[]):
    """Print all integers of a list in reverse order."""
    if my_list is not None:
        for number in reversed(my_list):
            print("{:d}".format(number))
EOF_E3F0789C82C6
cat > "$TARGET/4-main.py" <<'EOF_0A3BEE2C3A55'
#!/usr/bin/python3
new_in_list = __import__('4-new_in_list').new_in_list

my_list = [1, 2, 3, 4, 5]
idx = 3
new_element = 9
new_list = new_in_list(my_list, idx, new_element)

print(new_list)
print(my_list)
EOF_0A3BEE2C3A55
cat > "$TARGET/4-new_in_list.py" <<'EOF_6931E6BAF5BF'
#!/usr/bin/python3
def new_in_list(my_list, idx, element):
    """Return a modified copy without changing the original list."""
    new_list = my_list.copy()
    if 0 <= idx < len(new_list):
        new_list[idx] = element
    return new_list
EOF_6931E6BAF5BF
cat > "$TARGET/5-main.py" <<'EOF_0EC19A350511'
#!/usr/bin/env python3
no_c = __import__('5-no_c').no_c

print(no_c("Best School"))
print(no_c("Chicago"))
print(no_c("C is fun!"))
EOF_0EC19A350511
cat > "$TARGET/5-no_c.py" <<'EOF_C05919D090C4'
#!/usr/bin/python3
def no_c(my_string):
    """Return a copy of a string without c or C characters."""
    return "".join(char for char in my_string if char not in "cC")
EOF_C05919D090C4
cat > "$TARGET/6-main.py" <<'EOF_2A097FDDCCD0'
#!/usr/bin/python3
print_matrix_integer =     __import__('6-print_matrix_integer').print_matrix_integer

matrix = [
    [1, 2, 3],
    [4, 5, 6],
    [7, 8, 9]
]

print_matrix_integer(matrix)
print("--")
print_matrix_integer()
EOF_2A097FDDCCD0
cat > "$TARGET/6-print_matrix_integer.py" <<'EOF_C50CE398AA69'
#!/usr/bin/python3
def print_matrix_integer(matrix=[[]]):
    """Print a matrix of integers."""
    for row in matrix:
        for index in range(len(row)):
            ending = "" if index == len(row) - 1 else " "
            print("{:d}".format(row[index]), end=ending)
        print()
EOF_C50CE398AA69
cat > "$TARGET/7-add_tuple.py" <<'EOF_AD7B1FF95578'
#!/usr/bin/python3
def add_tuple(tuple_a=(), tuple_b=()):
    """Add the first two elements of two tuples."""
    a_first = tuple_a[0] if len(tuple_a) > 0 else 0
    a_second = tuple_a[1] if len(tuple_a) > 1 else 0
    b_first = tuple_b[0] if len(tuple_b) > 0 else 0
    b_second = tuple_b[1] if len(tuple_b) > 1 else 0
    return (a_first + b_first, a_second + b_second)
EOF_AD7B1FF95578
cat > "$TARGET/7-main.py" <<'EOF_301752523AEB'
#!/usr/bin/python3
add_tuple = __import__('7-add_tuple').add_tuple

tuple_a = (1, 89)
tuple_b = (88, 11)
new_tuple = add_tuple(tuple_a, tuple_b)
print(new_tuple)

print(add_tuple(tuple_a, (1, )))
print(add_tuple(tuple_a, ()))
EOF_301752523AEB
cat > "$TARGET/8-main.py" <<'EOF_922C8D37DFB5'
#!/usr/bin/python3
multiple_returns = __import__('8-multiple_returns').multiple_returns

sentence = "At school, I learnt C!"
length, first = multiple_returns(sentence)
print("Length: {:d} - First character: {}".format(length, first))
EOF_922C8D37DFB5
cat > "$TARGET/8-multiple_returns.py" <<'EOF_3FE0B30B7732'
#!/usr/bin/python3
def multiple_returns(sentence):
    """Return the length and first character of a string."""
    if len(sentence) == 0:
        return (0, None)
    return (len(sentence), sentence[0])
EOF_3FE0B30B7732
cat > "$TARGET/9-main.py" <<'EOF_589392264A2B'
#!/usr/bin/python3
max_integer = __import__('9-max_integer').max_integer

my_list = [1, 90, 2, 13, 34, 5, -13, 3]
max_value = max_integer(my_list)
print("Max: {}".format(max_value))
EOF_589392264A2B
cat > "$TARGET/9-max_integer.py" <<'EOF_45BA43D52382'
#!/usr/bin/python3
def max_integer(my_list=[]):
    """Return the largest integer in a list, or None if empty."""
    if len(my_list) == 0:
        return None

    largest = my_list[0]
    for number in my_list[1:]:
        if number > largest:
            largest = number
    return largest
EOF_45BA43D52382
cat > "$TARGET/README.md" <<'EOF_8EC9A00BFD09'
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
EOF_8EC9A00BFD09
cat > "$TARGET/linked_lists.c" <<'EOF_09FBF2DFB9DA'
#include <stdio.h>
#include <stdlib.h>
#include "lists.h"

/**
 * print_listint - prints all elements of a listint_t list
 * @h: pointer to the head of the list
 *
 * Return: number of nodes
 */
size_t print_listint(const listint_t *h)
{
	size_t count = 0;

	while (h != NULL)
	{
		printf("%i\n", h->n);
		h = h->next;
		count++;
	}
	return (count);
}

/**
 * add_nodeint_end - adds a new node at the end of a list
 * @head: address of the head pointer
 * @n: value for the new node
 *
 * Return: address of the new node, or NULL on failure
 */
listint_t *add_nodeint_end(listint_t **head, const int n)
{
	listint_t *new_node, *current;

	new_node = malloc(sizeof(*new_node));
	if (new_node == NULL)
		return (NULL);
	new_node->n = n;
	new_node->next = NULL;

	if (*head == NULL)
	{
		*head = new_node;
		return (new_node);
	}

	current = *head;
	while (current->next != NULL)
		current = current->next;
	current->next = new_node;
	return (new_node);
}

/**
 * free_listint - frees a listint_t list
 * @head: head of the list
 */
void free_listint(listint_t *head)
{
	listint_t *next;

	while (head != NULL)
	{
		next = head->next;
		free(head);
		head = next;
	}
}
EOF_09FBF2DFB9DA
cat > "$TARGET/lists.h" <<'EOF_12D727F669A5'
#ifndef LISTS_H
#define LISTS_H

#include <stddef.h>

/**
 * struct listint_s - singly linked list node
 * @n: integer value
 * @next: pointer to the next node
 */
typedef struct listint_s
{
	int n;
	struct listint_s *next;
} listint_t;

size_t print_listint(const listint_t *h);
listint_t *add_nodeint_end(listint_t **head, const int n);
void free_listint(listint_t *head);
int is_palindrome(listint_t **head);

#endif /* LISTS_H */
EOF_12D727F669A5
cat > "$TARGET/run_all_tests.sh" <<'EOF_4DA266EAAB16'
#!/usr/bin/env bash
set -eu

cd "$(dirname "$0")"

pass() {
    printf '[PASS] %s\n' "$1"
}

fail() {
    printf '[FAIL] %s\n' "$1" >&2
    exit 1
}

for file in ./*.py; do
    python3 -m py_compile "$file"
done
pass "Python syntax"

[[ "$(./0-main.py)" == $'1\n2\n3\n4\n5' ]] ||
    fail "0-print_list_integer.py"
pass "0-print_list_integer.py"

[[ "$(./1-main.py)" == 'Element at index 3 is 4' ]] ||
    fail "1-element_at.py"
python3 -c \
'f = __import__("1-element_at").element_at; assert f([1, 2], -1) is None; assert f([1, 2], 2) is None'
pass "1-element_at.py"

[[ "$(./2-main.py)" == $'[1, 2, 3, 9, 5]\n[1, 2, 3, 9, 5]' ]] ||
    fail "2-replace_in_list.py"
pass "2-replace_in_list.py"

[[ "$(./3-main.py)" == $'5\n4\n3\n2\n1' ]] ||
    fail "3-print_reversed_list_integer.py"
pass "3-print_reversed_list_integer.py"

[[ "$(./4-main.py)" == $'[1, 2, 3, 9, 5]\n[1, 2, 3, 4, 5]' ]] ||
    fail "4-new_in_list.py"
pass "4-new_in_list.py"

[[ "$(./5-main.py)" == $'Best Shool\nhiago\n is fun!' ]] ||
    fail "5-no_c.py"
pass "5-no_c.py"

[[ "$(./6-main.py)" == $'1 2 3\n4 5 6\n7 8 9\n--' ]] ||
    fail "6-print_matrix_integer.py"
pass "6-print_matrix_integer.py"

[[ "$(./7-main.py)" == $'(89, 100)\n(2, 89)\n(1, 89)' ]] ||
    fail "7-add_tuple.py"
pass "7-add_tuple.py"

[[ "$(./8-main.py)" == 'Length: 22 - First character: A' ]] ||
    fail "8-multiple_returns.py"
pass "8-multiple_returns.py"

[[ "$(./9-main.py)" == 'Max: 90' ]] ||
    fail "9-max_integer.py"
pass "9-max_integer.py"

expected=$'0 is divisible by 2\n1 is not divisible by 2\n2 is divisible by 2\n3 is not divisible by 2\n4 is divisible by 2\n5 is not divisible by 2\n6 is divisible by 2'
[[ "$(./10-main.py)" == "$expected" ]] ||
    fail "10-divisible_by_2.py"
pass "10-divisible_by_2.py"

[[ "$(./11-main.py)" == $'[1, 2, 3, 5]\n[1, 2, 3, 5]' ]] ||
    fail "11-delete_at.py"
pass "11-delete_at.py"

[[ "$(./12-switch.py)" == 'a=10 - b=89' ]] ||
    fail "12-switch.py output"
[[ "$(wc -l < 12-switch.py)" -eq 5 ]] ||
    fail "12-switch.py line count"
pass "12-switch.py"

gcc -Wall -Werror -Wextra -pedantic -std=gnu89 \
    13-main.c linked_lists.c 13-is_palindrome.c -o palindrome
./palindrome | tail -n 1 | grep -qx 'Linked list is a palindrome' ||
    fail "13-is_palindrome.c"
rm -f palindrome
pass "13-is_palindrome.c"

if command -v python3-config >/dev/null 2>&1; then
    gcc -Wall -Werror -Wextra -pedantic -std=c99 -shared \
        -Wl,-soname,PyList -o libPyList.so -fPIC \
        $(python3-config --includes) 100-print_python_list_info.c
    python3 100-test_lists.py >/dev/null
    rm -f libPyList.so
    pass "100-print_python_list_info.c"
else
    printf '[SKIP] CPython development headers unavailable\n'
fi

find . -type d -name __pycache__ -prune -exec rm -rf {} +
printf '\nAll local tests passed.\n'
EOF_4DA266EAAB16
chmod +x "$TARGET"/*.py "$TARGET"/run_all_tests.sh
printf "Created %s\n" "$TARGET"