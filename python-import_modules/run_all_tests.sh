#!/usr/bin/env bash
set -eu
cd "$(dirname "$0")"

pass() { printf '[PASS] %s\n' "$1"; }
fail() { printf '[FAIL] %s\n' "$1" >&2; exit 1; }

for file in ./*.py local-tests/*.py; do
    python3 -m py_compile "$file"
done
pass "Python syntax"

[[ "$(./0-add.py)" == "1 + 2 = 3" ]] || fail "0-add.py"
[[ -z "$(python3 -c '__import__("0-add")')" ]] || fail "0-add.py import guard"
pass "0-add.py"

expected=$'10 + 5 = 15\n10 - 5 = 5\n10 * 5 = 50\n10 / 5 = 2'
[[ "$(./1-calculation.py)" == "$expected" ]] || fail "1-calculation.py"
[[ -z "$(python3 -c '__import__("1-calculation")')" ]] || fail "1-calculation.py import guard"
pass "1-calculation.py"

[[ "$(./2-args.py)" == "0 arguments." ]] || fail "2-args.py no arguments"
expected=$'1 argument:\n1: Hello'
[[ "$(./2-args.py Hello)" == "$expected" ]] || fail "2-args.py one argument"
expected=$'3 arguments:\n1: Hello\n2: Best\n3: School'
[[ "$(./2-args.py Hello Best School)" == "$expected" ]] || fail "2-args.py several arguments"
pass "2-args.py"

[[ "$(./3-infinite_add.py)" == "0" ]] || fail "3-infinite_add.py empty"
[[ "$(./3-infinite_add.py 79 10 -40 -300 89)" == "-162" ]] || fail "3-infinite_add.py values"
pass "3-infinite_add.py"

expected=$'my_secret_santa\nprint_hidden\nprint_school'
[[ "$(PYTHONPATH=local-tests ./4-hidden_discovery.py)" == "$expected" ]] || fail "4-hidden_discovery.py"
pass "4-hidden_discovery.py"

[[ "$(./5-variable_load.py)" == "98" ]] || fail "5-variable_load.py"
pass "5-variable_load.py"

set +e
usage_output="$(./100-my_calculator.py 2>&1)"; usage_status=$?
set -e
[[ $usage_status -eq 1 ]] || fail "100-my_calculator.py usage status"
[[ "$usage_output" == "Usage: ./100-my_calculator.py <a> <operator> <b>" ]] || fail "100-my_calculator.py usage output"
[[ "$(./100-my_calculator.py 3 + 5)" == "3 + 5 = 8" ]] || fail "calculator addition"
[[ "$(./100-my_calculator.py 9 - 2)" == "9 - 2 = 7" ]] || fail "calculator subtraction"
[[ "$(./100-my_calculator.py 3 '*' 5)" == "3 * 5 = 15" ]] || fail "calculator multiplication"
[[ "$(./100-my_calculator.py 10 / 4)" == "10 / 4 = 2" ]] || fail "calculator division"
set +e
operator_output="$(./100-my_calculator.py 3 H 5 2>&1)"; operator_status=$?
set -e
[[ $operator_status -eq 1 ]] || fail "calculator operator status"
[[ "$operator_output" == "Unknown operator. Available operators: +, -, * and /" ]] || fail "calculator operator output"
pass "100-my_calculator.py"

[[ "$(./101-easy_print.py)" == "#pythoniscool" ]] || fail "101-easy_print.py"
[[ "$(wc -l < 101-easy_print.py)" -le 2 ]] || fail "101-easy_print.py line count"
pass "101-easy_print.py"

[[ "$(PYTHONPATH=. python3 local-tests/102-main.py)" == $'12\n5' ]] || fail "102-magic_calculation.py"
pass "102-magic_calculation.py"

[[ "$(./103-fast_alphabet.py)" == "ABCDEFGHIJKLMNOPQRSTUVWXYZ" ]] || fail "103-fast_alphabet.py"
[[ "$(wc -l < 103-fast_alphabet.py)" -le 3 ]] || fail "103-fast_alphabet.py line count"
pass "103-fast_alphabet.py"

printf '\nAll local tests passed.\n'
