#!/usr/bin/python3
def replace_in_list(my_list, idx, element):
    """Replace an element at idx when the index is valid."""
    if 0 <= idx < len(my_list):
        my_list[idx] = element
    return my_list
