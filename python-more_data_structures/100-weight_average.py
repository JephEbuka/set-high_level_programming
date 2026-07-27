#!/usr/bin/python3
"""Calculate a weighted average."""


def weight_average(my_list=[]):
    """Return the weighted average of score-weight tuples."""
    if not my_list:
        return 0

    weighted_total = sum(score * weight for score, weight in my_list)
    total_weight = sum(weight for _, weight in my_list)
    return weighted_total / total_weight if total_weight else 0
