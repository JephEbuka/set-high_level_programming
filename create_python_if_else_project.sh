#!/usr/bin/env bash
set -e
TARGET="${1:-python-if_else_loops_functions}"
mkdir -p "$TARGET"
cat > "$TARGET/0-positive_or_negative.py" <<'__FILE_0_positive_or_negative_py__'
#!/usr/bin/python3
import random
number = random.randint(-10, 10)
if number > 0:
    print(f"{number} is positive")
elif number == 0:
    print(f"{number} is zero")
else:
    print(f"{number} is negative")
__FILE_0_positive_or_negative_py__
cat > "$TARGET/1-last_digit.py" <<'__FILE_1_last_digit_py__'
#!/usr/bin/python3
import random
number = random.randint(-10000, 10000)
last_digit = abs(number) % 10
if number < 0:
    last_digit = -last_digit
print(f"Last digit of {number} is {last_digit}", end=" ")
if last_digit > 5:
    print("and is greater than 5")
elif last_digit == 0:
    print("and is 0")
else:
    print("and is less than 6 and not 0")
__FILE_1_last_digit_py__
cat > "$TARGET/10-add.py" <<'__FILE_10_add_py__'
#!/usr/bin/python3


def add(a, b):
    return a + b
__FILE_10_add_py__
cat > "$TARGET/10-main.py" <<'__FILE_10_main_py__'
#!/usr/bin/env python3
add = __import__('10-add').add

print(add(1, 2))
print(add(98, 0))
print(add(100, -2))
__FILE_10_main_py__
cat > "$TARGET/100-print_tebahpla.py" <<'__FILE_100_print_tebahpla_py__'
#!/usr/bin/python3
for i in range(122, 96, -1):
    print("{:c}".format(i if i % 2 == 0 else i - 32), end="")
__FILE_100_print_tebahpla_py__
cat > "$TARGET/101-main.py" <<'__FILE_101_main_py__'
#!/usr/bin/env python3
remove_char_at = __import__('101-remove_char_at').remove_char_at

print(remove_char_at("Best School", 3))
print(remove_char_at("Chicago", 2))
print(remove_char_at("C is fun!", 0))
print(remove_char_at("School", 10))
print(remove_char_at("Python", -2))
__FILE_101_main_py__
cat > "$TARGET/101-remove_char_at.py" <<'__FILE_101_remove_char_at_py__'
#!/usr/bin/python3


def remove_char_at(str, n):
    if n < 0:
        return str
    return str[:n] + str[n + 1:]
__FILE_101_remove_char_at_py__
cat > "$TARGET/102-magic_calculation.py" <<'__FILE_102_magic_calculation_py__'
#!/usr/bin/python3


def magic_calculation(a, b, c):
    if a < b:
        return c
    if c > b:
        return a + b
    return a * b - c
__FILE_102_magic_calculation_py__
cat > "$TARGET/102-main.py" <<'__FILE_102_main_py__'
#!/usr/bin/env python3
magic_calculation = __import__('102-magic_calculation').magic_calculation

print(magic_calculation(1, 2, 3))
print(magic_calculation(5, 2, 4))
print(magic_calculation(5, 3, 2))
__FILE_102_main_py__
cat > "$TARGET/11-main.py" <<'__FILE_11_main_py__'
#!/usr/bin/env python3
pow = __import__('11-pow').pow

print(pow(2, 2))
print(pow(98, 2))
print(pow(98, 0))
print(pow(100, -2))
print(pow(-4, 5))
__FILE_11_main_py__
cat > "$TARGET/11-pow.py" <<'__FILE_11_pow_py__'
#!/usr/bin/python3


def pow(a, b):
    return a ** b
__FILE_11_pow_py__
cat > "$TARGET/12-fizzbuzz.py" <<'__FILE_12_fizzbuzz_py__'
#!/usr/bin/python3


def fizzbuzz():
    for number in range(1, 101):
        if number % 15 == 0:
            print("FizzBuzz", end=" ")
        elif number % 3 == 0:
            print("Fizz", end=" ")
        elif number % 5 == 0:
            print("Buzz", end=" ")
        else:
            print("{}".format(number), end=" ")
__FILE_12_fizzbuzz_py__
cat > "$TARGET/12-main.py" <<'__FILE_12_main_py__'
#!/usr/bin/env python3
fizzbuzz = __import__('12-fizzbuzz').fizzbuzz

fizzbuzz()
print("")
__FILE_12_main_py__
cat > "$TARGET/13-insert_number.c" <<'__FILE_13_insert_number_c__'
#include <stdlib.h>
#include "lists.h"

/**
 * insert_node - inserts a number into a sorted singly linked list
 * @head: pointer to the head of the list
 * @number: number to insert
 *
 * Return: address of the new node, or NULL on failure
 */
listint_t *insert_node(listint_t **head, int number)
{
	listint_t *new_node, *current;

	if (head == NULL)
		return (NULL);

	new_node = malloc(sizeof(listint_t));
	if (new_node == NULL)
		return (NULL);

	new_node->n = number;

	if (*head == NULL || (*head)->n >= number)
	{
		new_node->next = *head;
		*head = new_node;
		return (new_node);
	}

	current = *head;
	while (current->next != NULL && current->next->n < number)
		current = current->next;

	new_node->next = current->next;
	current->next = new_node;

	return (new_node);
}
__FILE_13_insert_number_c__
cat > "$TARGET/13-main.c" <<'__FILE_13_main_c__'
#include <stdlib.h>
#include <string.h>
#include <stdio.h>
#include "lists.h"

/**
 * main - checks insert_node
 *
 * Return: Always 0
 */
int main(void)
{
	listint_t *head;

	head = NULL;
	add_nodeint_end(&head, 0);
	add_nodeint_end(&head, 1);
	add_nodeint_end(&head, 2);
	add_nodeint_end(&head, 3);
	add_nodeint_end(&head, 4);
	add_nodeint_end(&head, 98);
	add_nodeint_end(&head, 402);
	add_nodeint_end(&head, 1024);
	print_listint(head);

	printf("-----------------\n");
	insert_node(&head, 27);
	print_listint(head);
	free_listint(head);

	return (0);
}
__FILE_13_main_c__
cat > "$TARGET/2-print_alphabet.py" <<'__FILE_2_print_alphabet_py__'
#!/usr/bin/python3
for i in range(97, 123):
    print("{:c}".format(i), end="")
__FILE_2_print_alphabet_py__
cat > "$TARGET/3-print_alphabt.py" <<'__FILE_3_print_alphabt_py__'
#!/usr/bin/python3
for i in range(97, 123):
    if i not in (101, 113):
        print("{:c}".format(i), end="")
__FILE_3_print_alphabt_py__
cat > "$TARGET/4-print_hexa.py" <<'__FILE_4_print_hexa_py__'
#!/usr/bin/python3
for i in range(99):
    print("{} = {}".format(i, hex(i)))
__FILE_4_print_hexa_py__
cat > "$TARGET/5-print_comb2.py" <<'__FILE_5_print_comb2_py__'
#!/usr/bin/python3
for i in range(100):
    print("{:02d}".format(i), end=", " if i < 99 else "\n")
__FILE_5_print_comb2_py__
cat > "$TARGET/6-print_comb3.py" <<'__FILE_6_print_comb3_py__'
#!/usr/bin/python3
for i in range(10):
    for j in range(i + 1, 10):
        print("{}{}".format(i, j), end=", " if (i, j) != (8, 9) else "\n")
__FILE_6_print_comb3_py__
cat > "$TARGET/7-islower.py" <<'__FILE_7_islower_py__'
#!/usr/bin/python3


def islower(c):
    return ord('a') <= ord(c) <= ord('z')
__FILE_7_islower_py__
cat > "$TARGET/7-main.py" <<'__FILE_7_main_py__'
#!/usr/bin/env python3
islower = __import__('7-islower').islower

print("a is {}".format("lower" if islower("a") else "upper"))
print("H is {}".format("lower" if islower("H") else "upper"))
print("A is {}".format("lower" if islower("A") else "upper"))
print("3 is {}".format("lower" if islower("3") else "upper"))
print("g is {}".format("lower" if islower("g") else "upper"))
__FILE_7_main_py__
cat > "$TARGET/8-main.py" <<'__FILE_8_main_py__'
#!/usr/bin/env python3
uppercase = __import__('8-uppercase').uppercase

uppercase("best")
uppercase("Best School 98 Battery street")
__FILE_8_main_py__
cat > "$TARGET/8-uppercase.py" <<'__FILE_8_uppercase_py__'
#!/usr/bin/python3


def uppercase(str):
    for c in str:
        if ord('a') <= ord(c) <= ord('z'):
            c = chr(ord(c) - 32)
        print("{}".format(c), end="")
    print()
__FILE_8_uppercase_py__
cat > "$TARGET/9-main.py" <<'__FILE_9_main_py__'
#!/usr/bin/env python3
print_last_digit = __import__('9-print_last_digit').print_last_digit

print_last_digit(98)
print_last_digit(0)
r = print_last_digit(-1024)
print(r)
__FILE_9_main_py__
cat > "$TARGET/9-print_last_digit.py" <<'__FILE_9_print_last_digit_py__'
#!/usr/bin/python3


def print_last_digit(number):
    last_digit = abs(number) % 10
    print("{}".format(last_digit), end="")
    return last_digit
__FILE_9_print_last_digit_py__
cat > "$TARGET/README.md" <<'__FILE_README_md__'
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
__FILE_README_md__
cat > "$TARGET/linked_lists.c" <<'__FILE_linked_lists_c__'
#include <stdio.h>
#include <stdlib.h>
#include "lists.h"

/**
 * print_listint - prints all elements of a listint_t list
 * @h: pointer to head of list
 * Return: number of nodes
 */
size_t print_listint(const listint_t *h)
{
	const listint_t *current;
	unsigned int n;

	current = h;
	n = 0;
	while (current != NULL)
	{
		printf("%i\n", current->n);
		current = current->next;
		n++;
	}

	return (n);
}

/**
 * add_nodeint_end - adds a new node at the end of a list
 * @head: pointer to pointer to the first node
 * @n: integer to place in the new node
 * Return: address of the new node, or NULL on failure
 */
listint_t *add_nodeint_end(listint_t **head, const int n)
{
	listint_t *new_node;
	listint_t *current;

	current = *head;
	new_node = malloc(sizeof(listint_t));
	if (new_node == NULL)
		return (NULL);

	new_node->n = n;
	new_node->next = NULL;

	if (*head == NULL)
		*head = new_node;
	else
	{
		while (current->next != NULL)
			current = current->next;
		current->next = new_node;
	}

	return (new_node);
}

/**
 * free_listint - frees a listint_t list
 * @head: pointer to the list to free
 */
void free_listint(listint_t *head)
{
	listint_t *current;

	while (head != NULL)
	{
		current = head;
		head = head->next;
		free(current);
	}
}
__FILE_linked_lists_c__
cat > "$TARGET/lists.h" <<'__FILE_lists_h__'
#ifndef LISTS_H
#define LISTS_H

#include <stdlib.h>

/**
 * struct listint_s - singly linked list
 * @n: integer
 * @next: points to the next node
 *
 * Description: singly linked list node structure
 */
typedef struct listint_s
{
	int n;
	struct listint_s *next;
} listint_t;

size_t print_listint(const listint_t *h);
listint_t *add_nodeint_end(listint_t **head, const int n);
void free_listint(listint_t *head);
listint_t *insert_node(listint_t **head, int number);

#endif /* LISTS_H */
__FILE_lists_h__
cat > "$TARGET/run_all_tests.sh" <<'__FILE_run_all_tests_sh__'
#!/usr/bin/env bash
set -e

cd "$(dirname "$0")"

echo "== Syntax checks =="
python3 -m py_compile ./*.py

echo "== Script tasks =="
./0-positive_or_negative.py
./1-last_digit.py
printf 'Alphabet: '
./2-print_alphabet.py
printf '\nAlphabet without q and e: '
./3-print_alphabt.py
printf '\nReverse alternating alphabet: '
./100-print_tebahpla.py
printf '\n'

./4-print_hexa.py > /tmp/4-print_hexa.out
./5-print_comb2.py > /tmp/5-print_comb2.out
./6-print_comb3.py > /tmp/6-print_comb3.out

echo "4-print_hexa.py: $(wc -l < /tmp/4-print_hexa.out) lines"
echo "5-print_comb2.py: $(cat /tmp/5-print_comb2.out)"
echo "6-print_comb3.py: $(cat /tmp/6-print_comb3.out)"

echo "== Function tasks =="
./7-main.py
./8-main.py
./9-main.py
./10-main.py
./11-main.py
./12-main.py
./101-main.py
./102-main.py

echo "== C task =="
gcc -Wall -Werror -Wextra -pedantic -std=gnu89 \
    13-main.c linked_lists.c 13-insert_number.c -o insert
./insert
rm -f insert

echo "All local tests completed successfully."
__FILE_run_all_tests_sh__
chmod +x "$TARGET"/*.py "$TARGET/run_all_tests.sh"
echo "Created $TARGET"