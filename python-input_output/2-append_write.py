#!/usr/bin/python3
"""Module for appending text to files."""


def append_write(filename="", text=""):
    """Append text to a UTF-8 file and return characters added."""
    with open(filename, "a", encoding="utf-8") as file:
        return file.write(text)
