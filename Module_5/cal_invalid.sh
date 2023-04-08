#!/bin/bash

i=$(python calc_input_generator.py)

student_output=$(python main.py < calc_invalid_input.txt)
expected_output=$(python mainCP.py < calc_invalid_input.txt)
shopt -s nocasematch

echo "$student_output"
if echo "$student_output" | grep -q "Result:"; then
	
    echo "$student_output" | grep Result: > student_output.txt

    sed 's/^[ \t]*//;s/[ \t]*$//' student_output.txt > student_trim_output.txt
fi

if echo "$expected_output" | grep -q "Result:"; then

    echo "$expected_output" | grep Result: > expected_output.txt

    sed 's/^[ \t]*//;s/[ \t]*$//' expected_output.txt > expected_trim_output.txt
fi

student=$(awk 'NR=1' student_trim_output.txt | tr -d '[:space:]' | grep -o 'Error-Notallvariablevaluesaredefined\.')
expected=$(awk 'NR=1' expected_trim_output.txt |  tr -d '[:space:]' | grep -o 'Error-Notallvariablevaluesaredefined\.')

echo "$student"
if [[ "$student" == "$expected" ]]; then
	
	TestOutput true "Testing calculator menu options:\n2. Store variable values \n4. Evaluate expression\nAdded the following variables & values:\n$(cat calc_invalid_data.txt)\nExpected: Error - Not all variable values are defined\nReceived:  Error - Not all variable values are defined"

else
	
	TestOutput false "Testing calculator menu options:\n2. Store variable values \n4. Evaluate expression\nAdded the following variables & values:\n$(cat calc_invalid_data.txt)\nExpected: Error-Notallvariablevaluesaredefined\nReceived: "$student""
fi
