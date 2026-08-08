#!/usr/bin/env bash
set -eu
TARGET="python-more_classes"
rm -rf "$TARGET"
mkdir -p "$TARGET"
cat > "$TARGET/0-rectangle.py" <<'EOF_0_RECTANGLE_PY'
#!/usr/bin/python3
"""Define an empty Rectangle class."""


class Rectangle:
    """Represent an empty rectangle."""

    pass
EOF_0_RECTANGLE_PY
cat > "$TARGET/1-rectangle.py" <<'EOF_1_RECTANGLE_PY'
#!/usr/bin/python3
"""Define a rectangle with validated dimensions."""


class Rectangle:
    """Represent a rectangle."""

    def __init__(self, width=0, height=0):
        """Initialize a rectangle."""
        self.width = width
        self.height = height

    @property
    def width(self):
        """Return the rectangle width."""
        return self.__width

    @width.setter
    def width(self, value):
        """Set and validate the rectangle width."""
        if type(value) is not int:
            raise TypeError("width must be an integer")
        if value < 0:
            raise ValueError("width must be >= 0")
        self.__width = value

    @property
    def height(self):
        """Return the rectangle height."""
        return self.__height

    @height.setter
    def height(self, value):
        """Set and validate the rectangle height."""
        if type(value) is not int:
            raise TypeError("height must be an integer")
        if value < 0:
            raise ValueError("height must be >= 0")
        self.__height = value
EOF_1_RECTANGLE_PY
cat > "$TARGET/101-nqueens.py" <<'EOF_101_NQUEENS_PY'
#!/usr/bin/python3
"""Solve the N Queens problem."""

import sys


def is_safe(queens, row, column):
    """Return whether a queen can be placed at row and column."""
    for placed_row, placed_column in queens:
        if placed_column == column:
            return False
        if abs(placed_row - row) == abs(placed_column - column):
            return False
    return True


def solve(n, row=0, queens=None):
    """Generate and print every valid arrangement of N queens."""
    if queens is None:
        queens = []

    if row == n:
        print(queens)
        return

    for column in range(n):
        if is_safe(queens, row, column):
            solve(n, row + 1, queens + [[row, column]])


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: nqueens N")
        sys.exit(1)

    try:
        board_size = int(sys.argv[1])
    except ValueError:
        print("N must be a number")
        sys.exit(1)

    if board_size < 4:
        print("N must be at least 4")
        sys.exit(1)

    solve(board_size)
EOF_101_NQUEENS_PY
cat > "$TARGET/2-rectangle.py" <<'EOF_2_RECTANGLE_PY'
#!/usr/bin/python3
"""Define a rectangle with area and perimeter methods."""


class Rectangle:
    """Represent a rectangle."""

    def __init__(self, width=0, height=0):
        """Initialize a rectangle."""
        self.width = width
        self.height = height

    @property
    def width(self):
        """Return the rectangle width."""
        return self.__width

    @width.setter
    def width(self, value):
        """Set and validate the rectangle width."""
        if type(value) is not int:
            raise TypeError("width must be an integer")
        if value < 0:
            raise ValueError("width must be >= 0")
        self.__width = value

    @property
    def height(self):
        """Return the rectangle height."""
        return self.__height

    @height.setter
    def height(self, value):
        """Set and validate the rectangle height."""
        if type(value) is not int:
            raise TypeError("height must be an integer")
        if value < 0:
            raise ValueError("height must be >= 0")
        self.__height = value

    def area(self):
        """Return the rectangle area."""
        return self.__width * self.__height

    def perimeter(self):
        """Return the rectangle perimeter."""
        if self.__width == 0 or self.__height == 0:
            return 0
        return 2 * (self.__width + self.__height)
EOF_2_RECTANGLE_PY
cat > "$TARGET/3-rectangle.py" <<'EOF_3_RECTANGLE_PY'
#!/usr/bin/python3
"""Define a rectangle with a printable string representation."""


class Rectangle:
    """Represent a rectangle."""

    def __init__(self, width=0, height=0):
        """Initialize a rectangle."""
        self.width = width
        self.height = height

    @property
    def width(self):
        """Return the rectangle width."""
        return self.__width

    @width.setter
    def width(self, value):
        """Set and validate the rectangle width."""
        if type(value) is not int:
            raise TypeError("width must be an integer")
        if value < 0:
            raise ValueError("width must be >= 0")
        self.__width = value

    @property
    def height(self):
        """Return the rectangle height."""
        return self.__height

    @height.setter
    def height(self, value):
        """Set and validate the rectangle height."""
        if type(value) is not int:
            raise TypeError("height must be an integer")
        if value < 0:
            raise ValueError("height must be >= 0")
        self.__height = value

    def area(self):
        """Return the rectangle area."""
        return self.__width * self.__height

    def perimeter(self):
        """Return the rectangle perimeter."""
        if self.__width == 0 or self.__height == 0:
            return 0
        return 2 * (self.__width + self.__height)

    def __str__(self):
        """Return the rectangle drawn with # characters."""
        if self.__width == 0 or self.__height == 0:
            return ""
        row = "#" * self.__width
        return "\n".join(row for _ in range(self.__height))
EOF_3_RECTANGLE_PY
cat > "$TARGET/4-rectangle.py" <<'EOF_4_RECTANGLE_PY'
#!/usr/bin/python3
"""Define a rectangle with string and official representations."""


class Rectangle:
    """Represent a rectangle."""

    def __init__(self, width=0, height=0):
        """Initialize a rectangle."""
        self.width = width
        self.height = height

    @property
    def width(self):
        """Return the rectangle width."""
        return self.__width

    @width.setter
    def width(self, value):
        """Set and validate the rectangle width."""
        if type(value) is not int:
            raise TypeError("width must be an integer")
        if value < 0:
            raise ValueError("width must be >= 0")
        self.__width = value

    @property
    def height(self):
        """Return the rectangle height."""
        return self.__height

    @height.setter
    def height(self, value):
        """Set and validate the rectangle height."""
        if type(value) is not int:
            raise TypeError("height must be an integer")
        if value < 0:
            raise ValueError("height must be >= 0")
        self.__height = value

    def area(self):
        """Return the rectangle area."""
        return self.__width * self.__height

    def perimeter(self):
        """Return the rectangle perimeter."""
        if self.__width == 0 or self.__height == 0:
            return 0
        return 2 * (self.__width + self.__height)

    def __str__(self):
        """Return the rectangle drawn with # characters."""
        if self.__width == 0 or self.__height == 0:
            return ""
        row = "#" * self.__width
        return "\n".join(row for _ in range(self.__height))

    def __repr__(self):
        """Return a representation that can recreate the rectangle."""
        return "Rectangle({}, {})".format(self.__width, self.__height)
EOF_4_RECTANGLE_PY
cat > "$TARGET/5-rectangle.py" <<'EOF_5_RECTANGLE_PY'
#!/usr/bin/python3
"""Define a rectangle that reports instance deletion."""


class Rectangle:
    """Represent a rectangle."""

    def __init__(self, width=0, height=0):
        """Initialize a rectangle."""
        self.width = width
        self.height = height

    @property
    def width(self):
        """Return the rectangle width."""
        return self.__width

    @width.setter
    def width(self, value):
        """Set and validate the rectangle width."""
        if type(value) is not int:
            raise TypeError("width must be an integer")
        if value < 0:
            raise ValueError("width must be >= 0")
        self.__width = value

    @property
    def height(self):
        """Return the rectangle height."""
        return self.__height

    @height.setter
    def height(self, value):
        """Set and validate the rectangle height."""
        if type(value) is not int:
            raise TypeError("height must be an integer")
        if value < 0:
            raise ValueError("height must be >= 0")
        self.__height = value

    def area(self):
        """Return the rectangle area."""
        return self.__width * self.__height

    def perimeter(self):
        """Return the rectangle perimeter."""
        if self.__width == 0 or self.__height == 0:
            return 0
        return 2 * (self.__width + self.__height)

    def __str__(self):
        """Return the rectangle drawn with # characters."""
        if self.__width == 0 or self.__height == 0:
            return ""
        row = "#" * self.__width
        return "\n".join(row for _ in range(self.__height))

    def __repr__(self):
        """Return a representation that can recreate the rectangle."""
        return "Rectangle({}, {})".format(self.__width, self.__height)

    def __del__(self):
        """Print a message when the rectangle is deleted."""
        print("Bye rectangle...")
EOF_5_RECTANGLE_PY
cat > "$TARGET/6-rectangle.py" <<'EOF_6_RECTANGLE_PY'
#!/usr/bin/python3
"""Define a rectangle that tracks its live instances."""


class Rectangle:
    """Represent a rectangle."""

    number_of_instances = 0

    def __init__(self, width=0, height=0):
        """Initialize a rectangle and increment the instance count."""
        self.width = width
        self.height = height
        Rectangle.number_of_instances += 1

    @property
    def width(self):
        """Return the rectangle width."""
        return self.__width

    @width.setter
    def width(self, value):
        """Set and validate the rectangle width."""
        if type(value) is not int:
            raise TypeError("width must be an integer")
        if value < 0:
            raise ValueError("width must be >= 0")
        self.__width = value

    @property
    def height(self):
        """Return the rectangle height."""
        return self.__height

    @height.setter
    def height(self, value):
        """Set and validate the rectangle height."""
        if type(value) is not int:
            raise TypeError("height must be an integer")
        if value < 0:
            raise ValueError("height must be >= 0")
        self.__height = value

    def area(self):
        """Return the rectangle area."""
        return self.__width * self.__height

    def perimeter(self):
        """Return the rectangle perimeter."""
        if self.__width == 0 or self.__height == 0:
            return 0
        return 2 * (self.__width + self.__height)

    def __str__(self):
        """Return the rectangle drawn with # characters."""
        if self.__width == 0 or self.__height == 0:
            return ""
        row = "#" * self.__width
        return "\n".join(row for _ in range(self.__height))

    def __repr__(self):
        """Return a representation that can recreate the rectangle."""
        return "Rectangle({}, {})".format(self.__width, self.__height)

    def __del__(self):
        """Decrement the instance count and report deletion."""
        Rectangle.number_of_instances -= 1
        print("Bye rectangle...")
EOF_6_RECTANGLE_PY
cat > "$TARGET/7-rectangle.py" <<'EOF_7_RECTANGLE_PY'
#!/usr/bin/python3
"""Define a rectangle with a configurable print symbol."""


class Rectangle:
    """Represent a rectangle."""

    number_of_instances = 0
    print_symbol = "#"

    def __init__(self, width=0, height=0):
        """Initialize a rectangle and increment the instance count."""
        self.width = width
        self.height = height
        Rectangle.number_of_instances += 1

    @property
    def width(self):
        """Return the rectangle width."""
        return self.__width

    @width.setter
    def width(self, value):
        """Set and validate the rectangle width."""
        if type(value) is not int:
            raise TypeError("width must be an integer")
        if value < 0:
            raise ValueError("width must be >= 0")
        self.__width = value

    @property
    def height(self):
        """Return the rectangle height."""
        return self.__height

    @height.setter
    def height(self, value):
        """Set and validate the rectangle height."""
        if type(value) is not int:
            raise TypeError("height must be an integer")
        if value < 0:
            raise ValueError("height must be >= 0")
        self.__height = value

    def area(self):
        """Return the rectangle area."""
        return self.__width * self.__height

    def perimeter(self):
        """Return the rectangle perimeter."""
        if self.__width == 0 or self.__height == 0:
            return 0
        return 2 * (self.__width + self.__height)

    def __str__(self):
        """Return the rectangle drawn with the selected print symbol."""
        if self.__width == 0 or self.__height == 0:
            return ""
        row = str(self.print_symbol) * self.__width
        return "\n".join(row for _ in range(self.__height))

    def __repr__(self):
        """Return a representation that can recreate the rectangle."""
        return "Rectangle({}, {})".format(self.__width, self.__height)

    def __del__(self):
        """Decrement the instance count and report deletion."""
        Rectangle.number_of_instances -= 1
        print("Bye rectangle...")
EOF_7_RECTANGLE_PY
cat > "$TARGET/8-rectangle.py" <<'EOF_8_RECTANGLE_PY'
#!/usr/bin/python3
"""Define comparable rectangles."""


class Rectangle:
    """Represent a rectangle."""

    number_of_instances = 0
    print_symbol = "#"

    def __init__(self, width=0, height=0):
        """Initialize a rectangle and increment the instance count."""
        self.width = width
        self.height = height
        Rectangle.number_of_instances += 1

    @property
    def width(self):
        """Return the rectangle width."""
        return self.__width

    @width.setter
    def width(self, value):
        """Set and validate the rectangle width."""
        if type(value) is not int:
            raise TypeError("width must be an integer")
        if value < 0:
            raise ValueError("width must be >= 0")
        self.__width = value

    @property
    def height(self):
        """Return the rectangle height."""
        return self.__height

    @height.setter
    def height(self, value):
        """Set and validate the rectangle height."""
        if type(value) is not int:
            raise TypeError("height must be an integer")
        if value < 0:
            raise ValueError("height must be >= 0")
        self.__height = value

    def area(self):
        """Return the rectangle area."""
        return self.__width * self.__height

    def perimeter(self):
        """Return the rectangle perimeter."""
        if self.__width == 0 or self.__height == 0:
            return 0
        return 2 * (self.__width + self.__height)

    def __str__(self):
        """Return the rectangle drawn with the selected print symbol."""
        if self.__width == 0 or self.__height == 0:
            return ""
        row = str(self.print_symbol) * self.__width
        return "\n".join(row for _ in range(self.__height))

    def __repr__(self):
        """Return a representation that can recreate the rectangle."""
        return "Rectangle({}, {})".format(self.__width, self.__height)

    def __del__(self):
        """Decrement the instance count and report deletion."""
        Rectangle.number_of_instances -= 1
        print("Bye rectangle...")

    @staticmethod
    def bigger_or_equal(rect_1, rect_2):
        """Return the rectangle with the greater area."""
        if not isinstance(rect_1, Rectangle):
            raise TypeError("rect_1 must be an instance of Rectangle")
        if not isinstance(rect_2, Rectangle):
            raise TypeError("rect_2 must be an instance of Rectangle")
        if rect_1.area() >= rect_2.area():
            return rect_1
        return rect_2
EOF_8_RECTANGLE_PY
cat > "$TARGET/9-rectangle.py" <<'EOF_9_RECTANGLE_PY'
#!/usr/bin/python3
"""Define rectangles with comparison and square construction helpers."""


class Rectangle:
    """Represent a rectangle."""

    number_of_instances = 0
    print_symbol = "#"

    def __init__(self, width=0, height=0):
        """Initialize a rectangle and increment the instance count."""
        self.width = width
        self.height = height
        Rectangle.number_of_instances += 1

    @property
    def width(self):
        """Return the rectangle width."""
        return self.__width

    @width.setter
    def width(self, value):
        """Set and validate the rectangle width."""
        if type(value) is not int:
            raise TypeError("width must be an integer")
        if value < 0:
            raise ValueError("width must be >= 0")
        self.__width = value

    @property
    def height(self):
        """Return the rectangle height."""
        return self.__height

    @height.setter
    def height(self, value):
        """Set and validate the rectangle height."""
        if type(value) is not int:
            raise TypeError("height must be an integer")
        if value < 0:
            raise ValueError("height must be >= 0")
        self.__height = value

    def area(self):
        """Return the rectangle area."""
        return self.__width * self.__height

    def perimeter(self):
        """Return the rectangle perimeter."""
        if self.__width == 0 or self.__height == 0:
            return 0
        return 2 * (self.__width + self.__height)

    def __str__(self):
        """Return the rectangle drawn with the selected print symbol."""
        if self.__width == 0 or self.__height == 0:
            return ""
        row = str(self.print_symbol) * self.__width
        return "\n".join(row for _ in range(self.__height))

    def __repr__(self):
        """Return a representation that can recreate the rectangle."""
        return "Rectangle({}, {})".format(self.__width, self.__height)

    def __del__(self):
        """Decrement the instance count and report deletion."""
        Rectangle.number_of_instances -= 1
        print("Bye rectangle...")

    @staticmethod
    def bigger_or_equal(rect_1, rect_2):
        """Return the rectangle with the greater area."""
        if not isinstance(rect_1, Rectangle):
            raise TypeError("rect_1 must be an instance of Rectangle")
        if not isinstance(rect_2, Rectangle):
            raise TypeError("rect_2 must be an instance of Rectangle")
        if rect_1.area() >= rect_2.area():
            return rect_1
        return rect_2

    @classmethod
    def square(cls, size=0):
        """Return a rectangle whose width and height equal size."""
        return cls(size, size)
EOF_9_RECTANGLE_PY
cat > "$TARGET/README.md" <<'EOF_README_MD'
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
EOF_README_MD
chmod +x "$TARGET"/*.py
printf "Created %s\n" "$TARGET"