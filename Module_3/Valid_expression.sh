#!/bin/bash

output=$(python main.py < input_cal.txt)

echo "$output" | grep "expression:" | grep -oP "(?<=: ).*" > output_cal.txt

cat I_OTest_cal.txt | grep "expression:" | grep -oP "(?<=: ).*" > output_expect_cal.txt


if [ -z "$(cat output_cal.txt)" ]; then

    echo TestOutput false "No Expression is Displayed"
    exit 1
else
    first_line_output=$(awk 'NR==1' output_cal.txt | tr -d '[:space:]')
    second_line_output=$(awk 'NR==2' output_cal.txt | tr -d '[:space:]')
    first_line_expect=$(awk 'NR==1' output_expect_cal.txt | tr -d '[:space:]')
    second_line_expect=$(awk 'NR==2' output_expect_cal.txt | tr -d '[:space:]')
    
    if [[ "$first_line_output" == "$first_line_expect" && "$second_line_output" == "$second_line_expect" ]]; then

        echo "$first_line_output"
        echo -e TestOutput true "Tested calculator menu option 2 store variable values:\nEntered:\nalpha1 = -5.2\nbeta2 = 10.3\na = 0.33\nb = -1.4\ntau = 3.14\nnum1 = 20\nResult:\nTest 1: $first_line_output\nExpected: $first_line_expect\nTest 2: $second_line_output\nExpected: $second_line_expect\nTestCase Passed."
    
    else
        echo TestOutput false "Tested calculator menu option 2 store variable values:\nEntered:\nalpha1 = -5.2\nbeta2 = 10.3\na = 0.33\nb = -1.4\ntau = 3.14\nnum1 = 20\nResult:\nTest 1: $first_line_output\nExpected: $first_line_expect\nTest 2: $second_line_output\nExpected: $second_line_expect\nTesCase Failed."
    
    fi
fi


