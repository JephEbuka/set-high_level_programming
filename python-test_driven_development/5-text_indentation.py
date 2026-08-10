#!/usr/bin/python3
"""Module for printing text with indentation after punctuation."""

def text_indentation(text):
    """Print text with two newlines after '.', '?' and ':'."""
    if not isinstance(text, str):
        raise TypeError("text must be a string")
    line = ""
    for char in text:
        line += char
        if char in ".?:":
            print(line.strip())
            print()
            line = ""
    if line:
        print(line.strip(), end="")
