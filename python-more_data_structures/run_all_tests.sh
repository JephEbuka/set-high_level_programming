#!/usr/bin/env bash
set -euo pipefail

cd "$(dirname "$0")"

printf 'Running Python syntax checks...\n'
python3 -m py_compile \
  0-square_matrix_simple.py \
  1-search_replace.py \
  2-uniq_add.py \
  3-common_elements.py \
  4-only_diff_elements.py \
  5-number_keys.py \
  6-print_sorted_dictionary.py \
  7-update_dictionary.py \
  8-simple_delete.py \
  9-multiply_by_2.py \
  10-best_score.py \
  11-multiply_list_map.py \
  12-roman_to_int.py \
  100-weight_average.py \
  101-square_matrix_map.py \
  102-complex_delete.py

printf 'Checking three-line task limits...\n'
[ "$(wc -l < 11-multiply_list_map.py)" -le 3 ]
[ "$(wc -l < 101-square_matrix_map.py)" -le 3 ]

printf 'Running supplied Python main files...\n'
for test_file in \
  0-main.py 1-main.py 2-main.py 3-main.py 4-main.py 5-main.py \
  6-main.py 7-main.py 8-main.py 9-main.py 10-main.py 11-main.py \
  12-main.py 100-main.py 101-main.py 102-main.py
do
  printf '\n===== %s =====\n' "$test_file"
  python3 "$test_file"
done

if command -v gcc >/dev/null 2>&1 && command -v python3-config >/dev/null 2>&1; then
  printf '\nCompiling CPython inspection library with local Python headers...\n'
  gcc -Wall -Werror -Wextra -pedantic -std=c99 -shared \
    -Wl,-soname,libPython.so -o libPython.so -fPIC \
    $(python3-config --includes) 103-python.c

  printf 'Running 103-tests.py against the local Python version...\n'
  python3 103-tests.py
else
  printf '\nSkipping task 16 compilation: gcc or python3-config is unavailable.\n'
fi

printf '\nAll available tests completed successfully.\n'
