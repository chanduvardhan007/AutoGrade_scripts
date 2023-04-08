#!/bin/bash

output=$(python main.py < input_cal.txt)

echo "$output" | grep "expression:" | grep -oP "(?<=: ).*" > output_cal.txt

cat I_OTest_cal.txt | grep "expression:" | grep -oP "(?<=: ).*" > output_expect_cal.txt

shopt -s nocasematch

if [ -z "$(cat output_cal.txt)" ]; then

    TestOutput false "No Expression is Displayed"
    exit 1
else
    first_line_output=$(awk 'NR==1' output_cal.txt | tr -d '[:space:]')
    second_line_output=$(awk 'NR==2' output_cal.txt | tr -d '[:space:]')
    first_line_expect=$(awk 'NR==1' output_expect_cal.txt | tr -d '[:space:]')
    second_line_expect=$(awk 'NR==2' output_expect_cal.txt | tr -d '[:space:]')

    if [[ "$first_line_output" == *"$first_line_expect"* && "$second_line_output" == *"$second_line_expect"* ]]; then
 
        TestOutput true "Testing calculator menu option 2 store variable values & option 3 print expression:\nEntered:\n\talpha1 = -5.2\n\tbeta2 = 10.3\n\ta = 0.33\n\tb = -1.4\n\ttau = 3.14\n\tnum1 = 20\n\nResults:\nTest 1 Expression: ((alpha1/beta1) + (alpha2/beta2))+c\nOutput: $first_line_output\nExpected: $first_line_expect\n\nTest 2 expression: a*lambda3+(tau//b)+(c*c))\nOutput: ${second_line_output:0:7} ${second_line_output:7:10}\nExpected:  ${second_line_output:0:7} ${second_line_output:7:10}\nTestCase Passed."
    
    else
        TestOutput false "Testing calculator menu option 2 store variable values & option 3 print expression:\nEntered:\n\talpha1 = -5.2\n\tbeta2 = 10.3\n\ta = 0.33\n\tb = -1.4\n\ttau = 3.14\n\tnum1 = 20\n\nResults:\nTest 1 Expression: ((alpha1/beta1) + (alpha2/beta2))+c\nOutput: $first_line_output\nExpected: $first_line_expect\n\nTest 2 expression: a*lambda3+(tau//b)+(c*c))\nOutput: ${second_line_output:0:7} ${second_line_output:7:10}\nExpected:  ${second_line_output:0:7} ${second_line_output:7:10}\nTestCase Failed."
    
    fi
fi
