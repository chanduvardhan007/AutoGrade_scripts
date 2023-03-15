
#!/bin/bash

output=$(python main.py < input.txt)


if echo "$output" | grep -q "addBookByKey Completed"; then

    echo "$output" | grep Book: > output.txt

    sed 's/^[ \t]*//;s/[ \t]*$//' output.txt > trim_output.txt
fi

cat I_OTest_2.txt | grep Book: > expect.txt


sed 's/^[ \t]*//;s/[ \t]*$//' expect.txt> trim_expect.txt


echo "$output" | grep -A 2 "removeFromShoppingCart" | sed 's/^[ \t]*//;s/[ \t]*$//' | grep "Title:" > trim_remove.txt

cat I_OTest_2.txt | grep -A 2 "removeFromShoppingCart" | sed 's/^[ \t]*//;s/[ \t]*$//' | grep "Title:" > trim_remove_expect.txt


Max_key=$(wc -l trim_output.txt | awk '{print $1}')

Max_expect_key=$(wc -l trim_expect.txt | awk '{print $1}')

if [ "$Max_key" != "$Max_expect_key" ]; then
    echo " Expected $Max_expect_key but $Max_key returned"
    exit 1
fi

if [ -z "$(cat trim_output.txt)" ]; then

	TestOutput false "Books are not Displayed"
    exit 1
  
else
	while read line1 <&3 && read line2 <&4; do
      if [[ "$line1" == "$line2" ]]; then
      	continue
      else
      	TestOutput false "The expected books are not displayed\nTest Case Failed"
      	exit 1
      fi
  	done 3<trim_output.txt 4<trim_expect.txt
    
fi

if [ -z "$(cat trim_remove.txt)" ]; then

	TestOutput false "No Books are removed from the Shopping cart"
    exit 1
else
    while read line1 <&3 && read line2 <&4; do
      if [[ "$line1" == "$line2" ]]; then
      	    continue
      else
        TestOutput false "Expected order of titles removed from cart:\n$(cat trim_remove_expect.txt)\nStudent output:\n$(cat trim_remove.txt)\nTestCase Failed."
      	exit 1
      fi
  	done 3<trim_remove.txt 4<trim_remove_expect.txt
    TestOutput true "Testing bookstore menu option “7 Add a book by key to shopping cart”...\nAdded the following book keys to the cart:\n$(cat trim_output.txt)\nExpected order of titles removed from cart:\n$(cat trim_remove_expect.txt)\nStudent output:\n$(cat trim_remove.txt)\nTestCase Passed."
fi