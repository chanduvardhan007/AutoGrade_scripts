output=$(python main.py < input_palindrome.txt)

echo "$output" | grep Result: > output_palindrome.txt

first_line=$(awk 'NR==1' output_palindrome.txt)
second_line=$(awk 'NR==2' output_palindrome.txt)

a=$(echo "$first_line" | grep -wi "palindrome")
b=$(echo "$second_line" | grep -wi "not a palindrome")


if [[ "$a" && "$b" ]];then
    echo -e "Test 1: aba\nExpected: Palindrome\nReceived: ${a:29:38}\nTest 2: abcd\nExpected: Not a Palindrome\nReceived: ${b:29:38}"
else
    echo -e "Test 1: aba\nExpected: Palindrome\nReceived: ${a:29:38}\nTest 2: abcd\nExpected: Not a Palindrome\nReceived: ${b:29:38}"
fi





