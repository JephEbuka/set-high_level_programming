#!/usr/bin/env bash
set -eu

cd "$(dirname "$0")"

pass() {
    printf '[PASS] %s\n' "$1"
}

fail() {
    printf '[FAIL] %s\n' "$1" >&2
    exit 1
}

for file in ./*.py; do
    python3 -m py_compile "$file"
done
pass "Python syntax"

[[ "$(./0-main.py)" == $'1\n2\n3\n4\n5' ]] ||
    fail "0-print_list_integer.py"
pass "0-print_list_integer.py"

[[ "$(./1-main.py)" == 'Element at index 3 is 4' ]] ||
    fail "1-element_at.py"
python3 -c \
'f = __import__("1-element_at").element_at; assert f([1, 2], -1) is None; assert f([1, 2], 2) is None'
pass "1-element_at.py"

[[ "$(./2-main.py)" == $'[1, 2, 3, 9, 5]\n[1, 2, 3, 9, 5]' ]] ||
    fail "2-replace_in_list.py"
pass "2-replace_in_list.py"

[[ "$(./3-main.py)" == $'5\n4\n3\n2\n1' ]] ||
    fail "3-print_reversed_list_integer.py"
pass "3-print_reversed_list_integer.py"

[[ "$(./4-main.py)" == $'[1, 2, 3, 9, 5]\n[1, 2, 3, 4, 5]' ]] ||
    fail "4-new_in_list.py"
pass "4-new_in_list.py"

[[ "$(./5-main.py)" == $'Best Shool\nhiago\n is fun!' ]] ||
    fail "5-no_c.py"
pass "5-no_c.py"

[[ "$(./6-main.py)" == $'1 2 3\n4 5 6\n7 8 9\n--' ]] ||
    fail "6-print_matrix_integer.py"
pass "6-print_matrix_integer.py"

[[ "$(./7-main.py)" == $'(89, 100)\n(2, 89)\n(1, 89)' ]] ||
    fail "7-add_tuple.py"
pass "7-add_tuple.py"

[[ "$(./8-main.py)" == 'Length: 22 - First character: A' ]] ||
    fail "8-multiple_returns.py"
pass "8-multiple_returns.py"

[[ "$(./9-main.py)" == 'Max: 90' ]] ||
    fail "9-max_integer.py"
pass "9-max_integer.py"

expected=$'0 is divisible by 2\n1 is not divisible by 2\n2 is divisible by 2\n3 is not divisible by 2\n4 is divisible by 2\n5 is not divisible by 2\n6 is divisible by 2'
[[ "$(./10-main.py)" == "$expected" ]] ||
    fail "10-divisible_by_2.py"
pass "10-divisible_by_2.py"

[[ "$(./11-main.py)" == $'[1, 2, 3, 5]\n[1, 2, 3, 5]' ]] ||
    fail "11-delete_at.py"
pass "11-delete_at.py"

[[ "$(./12-switch.py)" == 'a=10 - b=89' ]] ||
    fail "12-switch.py output"
[[ "$(wc -l < 12-switch.py)" -eq 5 ]] ||
    fail "12-switch.py line count"
pass "12-switch.py"

gcc -Wall -Werror -Wextra -pedantic -std=gnu89 \
    13-main.c linked_lists.c 13-is_palindrome.c -o palindrome
./palindrome | tail -n 1 | grep -qx 'Linked list is a palindrome' ||
    fail "13-is_palindrome.c"
rm -f palindrome
pass "13-is_palindrome.c"

if command -v python3-config >/dev/null 2>&1; then
    gcc -Wall -Werror -Wextra -pedantic -std=c99 -shared \
        -Wl,-soname,PyList -o libPyList.so -fPIC \
        $(python3-config --includes) 100-print_python_list_info.c
    python3 100-test_lists.py >/dev/null
    rm -f libPyList.so
    pass "100-print_python_list_info.c"
else
    printf '[SKIP] CPython development headers unavailable\n'
fi

find . -type d -name __pycache__ -prune -exec rm -rf {} +
printf '\nAll local tests passed.\n'
