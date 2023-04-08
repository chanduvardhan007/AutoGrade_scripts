#!/bin/bash

i=$(python calc_input_generator.py)

student_output=$(python main.py < calc_valid_input.txt)
expected_output=$(python mainCP.py < calc_valid_input.txt)
shopt -s nocasematch

#echo "$student_output" | grep -A 1 "Result:"
if echo "$student_output" | grep -A 1 "Result:"; then
	
    echo "$student_output" | grep -A 1 "Result:" > student_output.txt

    sed 's/^[ \t]*//;s/[ \t]*$//' student_output.txt > student_trim_output.txt
fi

if echo "$expected_output" | grep -qA 1 "Result:"; then

    echo "$expected_output" | grep -A 1 "Result:" > expected_output.txt

    sed 's/^[ \t]*//;s/[ \t]*$//' expected_output.txt > expected_trim_output.txt
fi

student_output1=$(awk 'NR=1' student_trim_output.txt | tr -d '[:space:]')
expected_output1=$(awk 'NR=1' expected_trim_output.txt |  tr -d '[:space:]')

student=$(echo "$student_output1" | grep -Eo '[-+]?[0-9]*\.?[0-9]+')
expected=$(echo "$expected_output1" | grep -Eo '[-+]?[0-9]*\.?[0-9]+')

if [[ "$student" == "$expected" ]]; then
	
	TestOutput true "Testing calculator menu options:\n2. Store variable values \n4. Evaluate expression\nAdded the following variables & values:\n$(cat calc_valid_data.txt)\nExpected: "$expected" \nReceived: "$student""

else
	
	TestOutput false "Testing calculator menu options:\n2. Store variable values \n4. Evaluate expression\nAdded the following variables & values:\n$(cat calc_valid_data.txt)\nExpected: "$expected" \nReceived: "$student""
fi

