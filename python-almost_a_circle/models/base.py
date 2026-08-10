#!/usr/bin/python3
"""Defines the Base class."""

import csv
import json


class Base:
    """Base class for all project models."""

    __nb_objects = 0

    def __init__(self, id=None):
        """Initialize a Base instance."""
        if id is not None:
            self.id = id
        else:
            Base.__nb_objects += 1
            self.id = Base.__nb_objects

    @staticmethod
    def to_json_string(list_dictionaries):
        """Return JSON string representation of dictionaries."""
        if not list_dictionaries:
            return "[]"
        return json.dumps(list_dictionaries)

    @classmethod
    def save_to_file(cls, list_objs):
        """Write object dictionaries to a JSON file."""
        filename = "{}.json".format(cls.__name__)
        dictionaries = []

        if list_objs is not None:
            dictionaries = [obj.to_dictionary() for obj in list_objs]

        with open(filename, "w", encoding="utf-8") as file:
            file.write(cls.to_json_string(dictionaries))

    @staticmethod
    def from_json_string(json_string):
        """Return list represented by a JSON string."""
        if not json_string:
            return []
        return json.loads(json_string)

    @classmethod
    def create(cls, **dictionary):
        """Create an instance and apply dictionary attributes."""
        if cls.__name__ == "Rectangle":
            instance = cls(1, 1)
        elif cls.__name__ == "Square":
            instance = cls(1)
        else:
            instance = cls()

        instance.update(**dictionary)
        return instance

    @classmethod
    def load_from_file(cls):
        """Load instances from a JSON file."""
        filename = "{}.json".format(cls.__name__)

        try:
            with open(filename, "r", encoding="utf-8") as file:
                dictionaries = cls.from_json_string(file.read())
        except FileNotFoundError:
            return []

        return [cls.create(**item) for item in dictionaries]

    @classmethod
    def save_to_file_csv(cls, list_objs):
        """Serialize instances to CSV."""
        filename = "{}.csv".format(cls.__name__)

        if cls.__name__ == "Rectangle":
            fields = ["id", "width", "height", "x", "y"]
        else:
            fields = ["id", "size", "x", "y"]

        with open(filename, "w", newline="", encoding="utf-8") as file:
            writer = csv.DictWriter(file, fieldnames=fields)

            if list_objs is not None:
                for obj in list_objs:
                    writer.writerow(obj.to_dictionary())

    @classmethod
    def load_from_file_csv(cls):
        """Deserialize instances from CSV."""
        filename = "{}.csv".format(cls.__name__)

        if cls.__name__ == "Rectangle":
            fields = ["id", "width", "height", "x", "y"]
        else:
            fields = ["id", "size", "x", "y"]

        try:
            with open(filename, "r", newline="", encoding="utf-8") as file:
                reader = csv.DictReader(file, fieldnames=fields)
                dictionaries = []

                for row in reader:
                    dictionaries.append(
                        {key: int(value) for key, value in row.items()}
                    )
        except FileNotFoundError:
            return []

        return [cls.create(**item) for item in dictionaries]

    @staticmethod
    def draw(list_rectangles, list_squares):
        """Draw Rectangles and Squares using turtle graphics."""
        import turtle

        screen = turtle.Screen()
        screen.title("Almost a Circle")
        screen.bgcolor("white")

        pen = turtle.Turtle()
        pen.speed(3)
        pen.pensize(2)

        pen.color("blue")
        for rectangle in list_rectangles:
            pen.penup()
            pen.goto(rectangle.x, rectangle.y)
            pen.pendown()

            for _ in range(2):
                pen.forward(rectangle.width)
                pen.left(90)
                pen.forward(rectangle.height)
                pen.left(90)

        pen.color("green")
        for square in list_squares:
            pen.penup()
            pen.goto(square.x, square.y)
            pen.pendown()

            for _ in range(4):
                pen.forward(square.size)
                pen.left(90)

        pen.hideturtle()
        screen.mainloop()
