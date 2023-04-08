#!/bin/bash

i=$(python bookstore_input_generator.py)

student_output=$(python main.py < bookstore_input_2.txt)
expected_output=$(python mainCP.py < bookstore_input_2.txt)
shopt -s nocasematch

echo "$student_output" | grep "Introduce the prefix:" | sed 's/Introduce the prefix: Added first matched title://'> student_titles.txt 

echo "$expected_output" | grep "Introduce the prefix:" | sed 's/Introduce the prefix: Added first matched title://'> expected_titles.txt

sed -i 's/^[[:space:]]*//; s/[[:space:]]*$//' student_titles.txt
sed -i 's/^[[:space:]]*//; s/[[:space:]]*$//' expected_titles.txt

echo "$student_output" | grep -A 1 "removeFromShoppingCart" | sed 's/removeFromShoppingCart//' | sed 's/^[ \t]*//;s/[ \t]*$//' | grep "Book:" > student_remove_titles.txt 

echo "$expected_output" | grep -A 1 "removeFromShoppingCart" | sed 's/removeFromShoppingCart//' | sed 's/^[ \t]*//;s/[ \t]*$//' | grep "Book:" > expected_remove_titles.txt 

#cat expected_remove_titles.txt
#echo "$output" | grep -A 2 "removeFromShoppingCart" | sed 's/^[ \t]*//;s/[ \t]*$//' | grep "Title:"

sed -i 's/^[[:space:]]*//; s/[[:space:]]*$//' student_remove_titles.txt
sed -i 's/^[[:space:]]*//; s/[[:space:]]*$//' expected_remove_titles.txt

if diff student_remove_titles.txt expected_remove_titles.txt >/dev/null; then
  TestOutput true "Testing Bookstore menu options:\n - 8. Add a book by title prefix to shopping cart\n - 4. Remove from the shopping cart\n\nAttempted to add the following prefixes:\n$(cat -n input_2_prefixes.txt)\n\nAdded to cart:\n$(cat -n student_titles.txt)\n\nExpected:\n$(cat -n expected_titles.txt)”
"
else
  TestOutput false "Testing Bookstore menu options:\n8. Add a book by title prefix to shopping cart\n4. Remove from the shopping cart\n\nAttempted to add the following prefixes:\n$(cat -n input_2_prefixes.txt)\n\nAdded to cart:\n$(cat -n student_titles.txt)\n\nExpected:\n$(cat -n expected_titles.txt)"
fi
