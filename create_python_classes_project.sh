#!/usr/bin/env bash
set -eu
TARGET="python-classes"
rm -rf "$TARGET"
mkdir -p "$TARGET"
cat > "$TARGET/0-main.py" <<'EOF_0_MAIN_PY'
#!/usr/bin/python3
Square = __import__('0-square').Square

my_square = Square()
print(type(my_square))
print(my_square.__dict__)
EOF_0_MAIN_PY
cat > "$TARGET/0-square.py" <<'EOF_0_SQUARE_PY'
#!/usr/bin/python3
"""Define an empty Square class."""


class Square:
    """Represent an empty square."""

    pass
EOF_0_SQUARE_PY
cat > "$TARGET/1-main.py" <<'EOF_1_MAIN_PY'
#!/usr/bin/python3
Square = __import__('1-square').Square

my_square = Square(3)
print(type(my_square))
print(my_square.__dict__)
try:
    print(my_square.size)
except Exception as e:
    print(e)
try:
    print(my_square.__size)
except Exception as e:
    print(e)
EOF_1_MAIN_PY
cat > "$TARGET/1-square.py" <<'EOF_1_SQUARE_PY'
#!/usr/bin/python3
"""Define a square by its private size."""


class Square:
    """Represent a square."""

    def __init__(self, size):
        """Initialize a square with a private size."""
        self.__size = size
EOF_1_SQUARE_PY
cat > "$TARGET/100-main.py" <<'EOF_100_MAIN_PY'
#!/usr/bin/python3
SinglyLinkedList = __import__('100-singly_linked_list').SinglyLinkedList
sll = SinglyLinkedList()
for value in (2, 5, 3, 10, 1, -4, -3, 4, 5, 12, 3):
    sll.sorted_insert(value)
print(sll)
EOF_100_MAIN_PY
cat > "$TARGET/100-singly_linked_list.py" <<'EOF_100_SINGLY_LINKED_LIST_PY'
#!/usr/bin/python3
"""Define a sorted singly linked list."""


class Node:
    """Represent a node in a singly linked list."""

    def __init__(self, data, next_node=None):
        """Initialize a node."""
        self.data = data
        self.next_node = next_node

    @property
    def data(self):
        """Return the node data."""
        return self.__data

    @data.setter
    def data(self, value):
        """Set and validate the node data."""
        if type(value) is not int:
            raise TypeError("data must be an integer")
        self.__data = value

    @property
    def next_node(self):
        """Return the next node."""
        return self.__next_node

    @next_node.setter
    def next_node(self, value):
        """Set and validate the next node."""
        if value is not None and not isinstance(value, Node):
            raise TypeError("next_node must be a Node object")
        self.__next_node = value


class SinglyLinkedList:
    """Represent a sorted singly linked list."""

    def __init__(self):
        """Initialize an empty list."""
        self.__head = None

    def __str__(self):
        """Return one node value per line."""
        values = []
        current = self.__head
        while current is not None:
            values.append(str(current.data))
            current = current.next_node
        return "\n".join(values)

    def sorted_insert(self, value):
        """Insert a new node in increasing order."""
        new_node = Node(value)
        if self.__head is None or value < self.__head.data:
            new_node.next_node = self.__head
            self.__head = new_node
            return
        current = self.__head
        while (current.next_node is not None
               and current.next_node.data < value):
            current = current.next_node
        new_node.next_node = current.next_node
        current.next_node = new_node
EOF_100_SINGLY_LINKED_LIST_PY
cat > "$TARGET/101-main.py" <<'EOF_101_MAIN_PY'
#!/usr/bin/python3
Square = __import__('101-square').Square
my_square = Square(5, (0, 0))
print(my_square)
print('--')
my_square = Square(5, (4, 1))
print(my_square)
EOF_101_MAIN_PY
cat > "$TARGET/101-square.py" <<'EOF_101_SQUARE_PY'
#!/usr/bin/python3
"""Define a printable square whose string form matches my_print."""


class Square:
    """Represent a square."""

    def __init__(self, size=0, position=(0, 0)):
        """Initialize a square."""
        self.size = size
        self.position = position

    @property
    def size(self):
        """Return the square size."""
        return self.__size

    @size.setter
    def size(self, value):
        """Set and validate the square size."""
        if type(value) is not int:
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    @property
    def position(self):
        """Return the square position."""
        return self.__position

    @position.setter
    def position(self, value):
        """Set and validate the square position."""
        valid = (isinstance(value, tuple) and len(value) == 2
                 and all(type(x) is int and x >= 0 for x in value))
        if not valid:
            raise TypeError("position must be a tuple of 2 positive integers")
        self.__position = value

    def area(self):
        """Return the square area."""
        return self.__size ** 2

    def __str__(self):
        """Return the square drawing as a string."""
        if self.__size == 0:
            return ""
        lines = [""] * self.__position[1]
        row = " " * self.__position[0] + "#" * self.__size
        lines.extend(row for _ in range(self.__size))
        return "\n".join(lines)

    def my_print(self):
        """Print the square using its size and position."""
        print(self)
EOF_101_SQUARE_PY
cat > "$TARGET/102-main.py" <<'EOF_102_MAIN_PY'
#!/usr/bin/python3
Square = __import__('102-square').Square
s_5 = Square(5)
s_6 = Square(6)
if s_5 < s_6:
    print('Square 5 < Square 6')
if s_5 <= s_6:
    print('Square 5 <= Square 6')
if s_5 == s_6:
    print('Square 5 == Square 6')
if s_5 != s_6:
    print('Square 5 != Square 6')
if s_5 > s_6:
    print('Square 5 > Square 6')
if s_5 >= s_6:
    print('Square 5 >= Square 6')
EOF_102_MAIN_PY
cat > "$TARGET/102-square.py" <<'EOF_102_SQUARE_PY'
#!/usr/bin/python3
"""Define squares that compare by area."""


class Square:
    """Represent a square."""

    def __init__(self, size=0):
        """Initialize a square."""
        self.size = size

    @property
    def size(self):
        """Return the square size."""
        return self.__size

    @size.setter
    def size(self, value):
        """Set and validate the square size."""
        if type(value) not in (int, float):
            raise TypeError("size must be a number")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        """Return the square area."""
        return self.__size ** 2

    def __eq__(self, other):
        return self.area() == other.area()

    def __ne__(self, other):
        return self.area() != other.area()

    def __lt__(self, other):
        return self.area() < other.area()

    def __le__(self, other):
        return self.area() <= other.area()

    def __gt__(self, other):
        return self.area() > other.area()

    def __ge__(self, other):
        return self.area() >= other.area()
EOF_102_SQUARE_PY
cat > "$TARGET/103-magic_class.py" <<'EOF_103_MAGIC_CLASS_PY'
#!/usr/bin/python3
"""Recreate the supplied MagicClass bytecode behavior."""

import math


class MagicClass:
    """Represent a circle."""

    def __init__(self, radius=0):
        """Initialize and validate a circle radius."""
        self.__radius = 0
        if type(radius) is not int and type(radius) is not float:
            raise TypeError("radius must be a number")
        self.__radius = radius

    def area(self):
        """Return the circle area."""
        return self.__radius ** 2 * math.pi

    def circumference(self):
        """Return the circle circumference."""
        return 2 * math.pi * self.__radius
EOF_103_MAGIC_CLASS_PY
cat > "$TARGET/103-main.py" <<'EOF_103_MAIN_PY'
#!/usr/bin/python3
MagicClass = __import__('103-magic_class').MagicClass
circle = MagicClass(3)
print('{:.2f}'.format(circle.area()))
print('{:.2f}'.format(circle.circumference()))
EOF_103_MAIN_PY
cat > "$TARGET/2-main.py" <<'EOF_2_MAIN_PY'
#!/usr/bin/python3
Square = __import__('2-square').Square

my_square_1 = Square(3)
print(type(my_square_1))
print(my_square_1.__dict__)
my_square_2 = Square()
print(type(my_square_2))
print(my_square_2.__dict__)
try:
    print(my_square_1.size)
except Exception as e:
    print(e)
try:
    print(my_square_1.__size)
except Exception as e:
    print(e)
try:
    my_square_3 = Square('3')
    print(type(my_square_3))
    print(my_square_3.__dict__)
except Exception as e:
    print(e)
try:
    my_square_4 = Square(-89)
    print(type(my_square_4))
    print(my_square_4.__dict__)
except Exception as e:
    print(e)
EOF_2_MAIN_PY
cat > "$TARGET/2-square.py" <<'EOF_2_SQUARE_PY'
#!/usr/bin/python3
"""Define a square with validated size."""


class Square:
    """Represent a square."""

    def __init__(self, size=0):
        """Initialize a square and validate its size."""
        if type(size) is not int:
            raise TypeError("size must be an integer")
        if size < 0:
            raise ValueError("size must be >= 0")
        self.__size = size
EOF_2_SQUARE_PY
cat > "$TARGET/3-main.py" <<'EOF_3_MAIN_PY'
#!/usr/bin/python3
Square = __import__('3-square').Square
my_square_1 = Square(3)
print('Area: {}'.format(my_square_1.area()))
try:
    print(my_square_1.size)
except Exception as e:
    print(e)
try:
    print(my_square_1.__size)
except Exception as e:
    print(e)
my_square_2 = Square(5)
print('Area: {}'.format(my_square_2.area()))
EOF_3_MAIN_PY
cat > "$TARGET/3-square.py" <<'EOF_3_SQUARE_PY'
#!/usr/bin/python3
"""Define a square with area calculation."""


class Square:
    """Represent a square."""

    def __init__(self, size=0):
        """Initialize a square and validate its size."""
        if type(size) is not int:
            raise TypeError("size must be an integer")
        if size < 0:
            raise ValueError("size must be >= 0")
        self.__size = size

    def area(self):
        """Return the square area."""
        return self.__size ** 2
EOF_3_SQUARE_PY
cat > "$TARGET/4-main.py" <<'EOF_4_MAIN_PY'
#!/usr/bin/python3
Square = __import__('4-square').Square
my_square = Square(89)
print('Area: {} for size: {}'.format(my_square.area(), my_square.size))
my_square.size = 3
print('Area: {} for size: {}'.format(my_square.area(), my_square.size))
try:
    my_square.size = '5 feet'
    print('Area: {} for size: {}'.format(my_square.area(), my_square.size))
except Exception as e:
    print(e)
EOF_4_MAIN_PY
cat > "$TARGET/4-square.py" <<'EOF_4_SQUARE_PY'
#!/usr/bin/python3
"""Define a square with a validated size property."""


class Square:
    """Represent a square."""

    def __init__(self, size=0):
        """Initialize a square."""
        self.size = size

    @property
    def size(self):
        """Return the square size."""
        return self.__size

    @size.setter
    def size(self, value):
        """Set and validate the square size."""
        if type(value) is not int:
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        """Return the square area."""
        return self.__size ** 2
EOF_4_SQUARE_PY
cat > "$TARGET/5-main.py" <<'EOF_5_MAIN_PY'
#!/usr/bin/python3
Square = __import__('5-square').Square
my_square = Square(3)
my_square.my_print()
print('--')
my_square.size = 10
my_square.my_print()
print('--')
my_square.size = 0
my_square.my_print()
print('--')
EOF_5_MAIN_PY
cat > "$TARGET/5-square.py" <<'EOF_5_SQUARE_PY'
#!/usr/bin/python3
"""Define a printable square."""


class Square:
    """Represent a square."""

    def __init__(self, size=0):
        """Initialize a square."""
        self.size = size

    @property
    def size(self):
        """Return the square size."""
        return self.__size

    @size.setter
    def size(self, value):
        """Set and validate the square size."""
        if type(value) is not int:
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    def area(self):
        """Return the square area."""
        return self.__size ** 2

    def my_print(self):
        """Print the square using the # character."""
        if self.__size == 0:
            print()
            return
        for _ in range(self.__size):
            print("#" * self.__size)
EOF_5_SQUARE_PY
cat > "$TARGET/6-main.py" <<'EOF_6_MAIN_PY'
#!/usr/bin/python3
Square = __import__('6-square').Square
my_square_1 = Square(3)
my_square_1.my_print()
print('--')
my_square_2 = Square(3, (1, 1))
my_square_2.my_print()
print('--')
my_square_3 = Square(3, (3, 0))
my_square_3.my_print()
print('--')
EOF_6_MAIN_PY
cat > "$TARGET/6-square.py" <<'EOF_6_SQUARE_PY'
#!/usr/bin/python3
"""Define a square with size and position."""


class Square:
    """Represent a square."""

    def __init__(self, size=0, position=(0, 0)):
        """Initialize a square."""
        self.size = size
        self.position = position

    @property
    def size(self):
        """Return the square size."""
        return self.__size

    @size.setter
    def size(self, value):
        """Set and validate the square size."""
        if type(value) is not int:
            raise TypeError("size must be an integer")
        if value < 0:
            raise ValueError("size must be >= 0")
        self.__size = value

    @property
    def position(self):
        """Return the square position."""
        return self.__position

    @position.setter
    def position(self, value):
        """Set and validate the square position."""
        valid = (isinstance(value, tuple) and len(value) == 2
                 and all(type(x) is int and x >= 0 for x in value))
        if not valid:
            raise TypeError("position must be a tuple of 2 positive integers")
        self.__position = value

    def area(self):
        """Return the square area."""
        return self.__size ** 2

    def my_print(self):
        """Print the square using its size and position."""
        if self.__size == 0:
            print()
            return
        for _ in range(self.__position[1]):
            print()
        for _ in range(self.__size):
            print(" " * self.__position[0] + "#" * self.__size)
EOF_6_SQUARE_PY
cat > "$TARGET/README.md" <<'EOF_README_MD'
# Python - Classes and Objects

This directory contains solutions for the **Python Classes and Objects** project in the `set-high_level_programming` repository.

## Topics covered

- classes and instances;
- public and private attributes;
- constructors and validation;
- properties, getters, and setters;
- instance methods and special methods;
- sorted singly linked lists;
- comparison operator overloading;
- rebuilding Python source from bytecode.

## Required files

`0-square.py`, `1-square.py`, `2-square.py`, `3-square.py`, `4-square.py`, `5-square.py`, `6-square.py`, `100-singly_linked_list.py`, `101-square.py`, `102-square.py`, and `103-magic_class.py`.

## Test files

The sample test files `0-main.py` through `6-main.py`, plus `100-main.py`, `101-main.py`, `102-main.py`, and `103-main.py`, are included.

## Run all tests

```bash
chmod +x run_all_tests.sh
./run_all_tests.sh
```

## Commit the project

```bash
git add python-classes
git commit -m "Complete Python classes project"
git push
```
EOF_README_MD
cat > "$TARGET/run_all_tests.sh" <<'EOF_RUN_ALL_TESTS_SH'
#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"

for file in ./*.py; do
    python3 -m py_compile "$file"
done
printf '[PASS] Python syntax\n'

python3 - <<'PYTEST'
import contextlib
import importlib
import io
import math
import subprocess


def output(script):
    return subprocess.check_output([f'./{script}'], text=True).rstrip('\n')

assert output('0-main.py') == "<class '0-square.Square'>\n{}"
print('[PASS] 0-square.py')
assert output('1-main.py') == (
    "<class '1-square.Square'>\n{'_Square__size': 3}\n"
    "'Square' object has no attribute 'size'\n"
    "'Square' object has no attribute '__size'"
)
print('[PASS] 1-square.py')
assert output('2-main.py') == (
    "<class '2-square.Square'>\n{'_Square__size': 3}\n"
    "<class '2-square.Square'>\n{'_Square__size': 0}\n"
    "'Square' object has no attribute 'size'\n"
    "'Square' object has no attribute '__size'\n"
    "size must be an integer\nsize must be >= 0"
)
print('[PASS] 2-square.py')
assert output('3-main.py') == (
    "Area: 9\n'Square' object has no attribute 'size'\n"
    "'Square' object has no attribute '__size'\nArea: 25"
)
print('[PASS] 3-square.py')
assert output('4-main.py') == (
    'Area: 7921 for size: 89\nArea: 9 for size: 3\n'
    'size must be an integer'
)
print('[PASS] 4-square.py')
assert output('5-main.py') == (
    '###\n###\n###\n--\n' + ('##########\n' * 10) + '--\n\n--'
)
print('[PASS] 5-square.py')
assert output('6-main.py') == (
    '###\n###\n###\n--\n\n ###\n ###\n ###\n--\n'
    '   ###\n   ###\n   ###\n--'
)
print('[PASS] 6-square.py')
assert output('100-main.py') == '-4\n-3\n1\n2\n3\n3\n4\n5\n5\n10\n12'
module = importlib.import_module('100-singly_linked_list')
try:
    module.Node('x')
    raise AssertionError('Node accepted non-integer data')
except TypeError as error:
    assert str(error) == 'data must be an integer'
try:
    module.Node(1).next_node = 3
    raise AssertionError('Node accepted invalid next_node')
except TypeError as error:
    assert str(error) == 'next_node must be a Node object'
print('[PASS] 100-singly_linked_list.py')
assert output('101-main.py') == (
    '#####\n#####\n#####\n#####\n#####\n--\n\n'
    '    #####\n    #####\n    #####\n    #####\n    #####'
)
Square = importlib.import_module('101-square').Square
assert str(Square()) == ''
assert str(Square(2, (2, 2))) == '\n\n  ##\n  ##'
print('[PASS] 101-square.py')
assert output('102-main.py') == (
    'Square 5 < Square 6\nSquare 5 <= Square 6\n'
    'Square 5 != Square 6'
)
for module_name in ('2-square', '3-square', '4-square', '5-square', '6-square', '101-square'):
    TestedSquare = importlib.import_module(module_name).Square
    try:
        TestedSquare(True)
        raise AssertionError(f'{module_name} accepted bool as size')
    except TypeError as error:
        assert str(error) == 'size must be an integer'
Square = importlib.import_module('102-square').Square
assert Square(2) == Square(2.0)
assert Square(3) > Square(2)
try:
    Square('3')
    raise AssertionError('Square accepted invalid size')
except TypeError as error:
    assert str(error) == 'size must be a number'
print('[PASS] 102-square.py')
assert output('103-main.py') == '28.27\n18.85'
MagicClass = importlib.import_module('103-magic_class').MagicClass
circle = MagicClass(3)
assert math.isclose(circle.area(), 9 * math.pi)
assert math.isclose(circle.circumference(), 6 * math.pi)
try:
    MagicClass(True)
    raise AssertionError('MagicClass accepted bool')
except TypeError as error:
    assert str(error) == 'radius must be a number'
print('[PASS] 103-magic_class.py')
PYTEST

if command -v pycodestyle >/dev/null 2>&1; then
    pycodestyle ./*.py
    printf '[PASS] pycodestyle\n'
else
    printf '[SKIP] pycodestyle is not installed\n'
fi

printf '\nAll local tests passed.\n'
EOF_RUN_ALL_TESTS_SH
chmod +x "$TARGET"/*.py "$TARGET"/run_all_tests.sh
printf "Created %s\n" "$TARGET"