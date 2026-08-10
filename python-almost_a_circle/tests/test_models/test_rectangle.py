#!/usr/bin/python3
"""Unit tests for Rectangle."""

import io
import unittest
from contextlib import redirect_stdout

from models.base import Base
from models.rectangle import Rectangle


class TestRectangle(unittest.TestCase):
    """Test Rectangle."""

    def setUp(self):
        """Reset IDs."""
        Base._Base__nb_objects = 0

    def test_attributes(self):
        """Test attributes."""
        rect = Rectangle(10, 2, 3, 4, 12)
        self.assertEqual(rect.width, 10)
        self.assertEqual(rect.height, 2)
        self.assertEqual(rect.x, 3)
        self.assertEqual(rect.y, 4)
        self.assertEqual(rect.id, 12)

    def test_width_type(self):
        """Test width type."""
        with self.assertRaisesRegex(TypeError, "width must be an integer"):
            Rectangle("10", 2)

    def test_height_type(self):
        """Test height type."""
        with self.assertRaisesRegex(TypeError, "height must be an integer"):
            Rectangle(10, "2")

    def test_width_value(self):
        """Test width value."""
        with self.assertRaisesRegex(ValueError, "width must be > 0"):
            Rectangle(0, 2)

    def test_height_value(self):
        """Test height value."""
        with self.assertRaisesRegex(ValueError, "height must be > 0"):
            Rectangle(2, 0)

    def test_x_value(self):
        """Test x value."""
        with self.assertRaisesRegex(ValueError, "x must be >= 0"):
            Rectangle(2, 3, -1)

    def test_y_value(self):
        """Test y value."""
        with self.assertRaisesRegex(ValueError, "y must be >= 0"):
            Rectangle(2, 3, 0, -1)

    def test_area(self):
        """Test area."""
        self.assertEqual(Rectangle(3, 2).area(), 6)

    def test_display(self):
        """Test display."""
        output = io.StringIO()
        with redirect_stdout(output):
            Rectangle(2, 2, 1, 1).display()
        self.assertEqual(output.getvalue(), "\n ##\n ##\n")

    def test_str(self):
        """Test string representation."""
        rect = Rectangle(4, 6, 2, 1, 12)
        self.assertEqual(str(rect), "[Rectangle] (12) 2/1 - 4/6")

    def test_update_args(self):
        """Test args update."""
        rect = Rectangle(10, 10, 10, 10)
        rect.update(89, 2, 3, 4, 5)
        self.assertEqual(
            rect.to_dictionary(),
            {"id": 89, "width": 2, "height": 3, "x": 4, "y": 5}
        )

    def test_update_kwargs(self):
        """Test kwargs update."""
        rect = Rectangle(10, 10)
        rect.update(width=2, height=3, x=4, y=5, id=89)
        self.assertEqual(
            rect.to_dictionary(),
            {"id": 89, "width": 2, "height": 3, "x": 4, "y": 5}
        )


if __name__ == "__main__":
    unittest.main()
