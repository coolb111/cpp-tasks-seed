#!/bin/bash

set -e

status=true
PROGRAM="./release"

echo "Test 1: Solve from CSV"
$PROGRAM AB.csv output.csv
if [ -f output.csv ]; then
    echo "PASS: output.csv created"
else
    echo "FAIL: output.csv not created"
    status=false
fi

echo "Test 2: Compare with expected output"
$PROGRAM AB.csv test_output.csv
cat > expected.csv << EOF
A0,A1,B
1.000000,0.000000,1.000000
-0.000000,1.000000,2.000000

Solution:
x0,x1,
1.000000,2.000000,
EOF

if cmp -s <(head -n 2 test_output.csv) <(head -n 2 expected.csv); then
    echo "PASS: output matches expected"
else
    echo "FAIL: output differs"
    diff <(head -n 2 test_output.csv) <(head -n 2 expected.csv)
    status=false
fi

# Тест 3: генерация случайной системы
echo "Test 3: Generate random system"
$PROGRAM --generate 5 random_output.csv
if [ -f random_output.csv ]; then
    echo "PASS: random system generated"
else
    echo "FAIL: random system not generated"
    status=false
fi

rm -f output.csv test_output.csv random_output.csv expected.csv

$status
