#!/bin/bash

output=$(python main.py < input_2.txt) 

if echo "$output" | grep -q "searchBookByInfix Completed"; then

    echo "$output" | grep Book: > output.txt

    sed 's/^[ \t]*//;s/[ \t]*$//' output.txt > trim_output.txt
fi

cat I_OTest_2.txt | grep Book: > expect.txt


sed 's/^[ \t]*//;s/[ \t]*$//' expect.txt> trim_expect.txt


diff_check=$(diff trim_output.txt trim_expect.txt)

# if [ -n "$diff_check" ] ;then
# 	TestOutput false " Tested searchBookByInfix(“WIII”, 25) but Wrong Books are displayed"
    
#     exit 1
# fi

cat trim_output.txt
Max_infix=$(wc -l trim_output.txt | awk '{print $1}')
# echo "$Max_infix"
Max_expect_infix=$(wc -l trim_expect.txt | awk '{print $1}')

if [ "$Max_infix" != "$Max_expect_infix" ]; then
    echo " Expected $Max_expect_infix but $Max_infix returned"
    exit 1
fi

if [ -z "$(cat trim_output.txt)" ]; then

	TestOutput false "Books are not Displayed"
  
else
	while read line1; do

      if grep -q "WIII" input_2.txt && grep -q "$line1" I_OTest_2.txt ; then
      	continue
      else
      	echo TestOutput false "The expected books are not displayed"
      	echo TestOutput false "Test Case Failed"
      	exit 1
      fi
  	done <trim_output.txt
    echo TestOutput true "TestCase Passed"
fi

# #!/bin/bash

# output=$(python main.py < input.txt) 

# echo "$output"

# if echo "$output" | grep -q "searchBookByInfix Completed"; then

#     echo "$output" | grep Book: > output.txt

#     # sed 's/^[ \t]*//;s/[ \t]*$//' output.txt > trim_output.txt
# fi

# # grep "Trees" input.txt

# if grep -q "Trees" input.txt;then

#     cat I_OTest_1.txt | grep Book: > expect.txt

# elif grep -q "WIII" input.txt;then

#     cat I_OTest_2.txt | grep Book: > expect.txt
# fi

# sed 's/^[ \t]*//;s/[ \t]*$//' output.txt > trim_output.txt

# sed 's/^[ \t]*//;s/[ \t]*$//' expect.txt > trim_expect.txt


# if [ -z "$(cat trim_output.txt)" ]; then

# 	TestOutput false "Books are not Displayed"
  
# else
# 	while read line1 && read line2 <&3; do

#       if grep -q "Trees" input.txt && grep -q "$line1" I_OTest_1.txt ; then
#       	continue
#       elif grep -q "WIII" input.txt && grep -q "$line1" I_OTest_2.txt ; then
#         continue
#       else
#       	TestOutput false "The expected books are not displayed"
#       	TestOutput false "Test Case Failed"
#       	exit 1
#       fi
#   	done <trim_output.txt 3<trim_expect.txt
#     echo TestOutput true "Passed"
# fi





