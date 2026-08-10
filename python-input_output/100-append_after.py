#!/usr/bin/python3
"""Module for inserting text after matching lines in a file."""


def append_after(filename="", search_string="", new_string=""):
    """Insert new_string after each line containing search_string."""
    with open(filename, "r", encoding="utf-8") as file:
        lines = file.readlines()

    updated = []
    for line in lines:
        updated.append(line)
        if search_string in line:
            updated.append(new_string)

    with open(filename, "w", encoding="utf-8") as file:
        file.writelines(updated)
