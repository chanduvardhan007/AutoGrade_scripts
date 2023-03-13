output=$(python main.py < input.txt)

echo "$output"
count=0
echo "$output" | grep Title: > output.txt

sed 's/^[ \t]*//;s/[ \t]*$//' output.txt > trim_output.txt

cat IO_test_1.txt | grep Title: > expect.txt

sed 's/^[ \t]*//;s/[ \t]*$//' expect.txt> trim_expect.txt
 

if [ -z "$(cat trim_output.txt)" ]; then

	TestOutput false "No Books are added to the Shopping Cart..."
  
else
	while read line1 <&3 && read line2 <&4; do
           
      if [[ "$line1" == "$line2" ]]; then
      		#echo "$line2"
      	    continue
      else
        echo TestOutput false "The expected book $line1 is not displayed"
        echo "$line2" >> display.txt
        count=$((count+1))
      fi
  	done 3<trim_output.txt 4<trim_expect.txt

    if [ $count -eq 0 ]; then
        
        echo TestOutput true "Added the following titles to the cart:\n$(cat trim_output.txt)"
        
    else
     	echo TestOutput false "The expected books are not displayed\n$(cat display.txt)"
        
    fi
    
fi


# Extracting the best seller name from shopping cart

echo "$output" | grep -A 1 "getCartBestSeller returned" > best_seller_output.txt

second_line=$(awk 'NR==2' best_seller_output.txt)



sleep 2s

if [[ "$second_line" == *"The Visitor's Book"* ]]; then
    echo TestOutput true "Testing bookstore menu option “6. Get cart best-seller”... "
    echo TestOutput true "Test Case passed"
else
    echo "Expected title of cart best-seller: The Visitor's Book"
    echo "Returned Title: $second_line"
fi


