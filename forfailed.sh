#!/bin/bash
i=0
# imput only the FAILED lines to the loop and read line
grep FAILED bpe.log | while read -r line ; do
    
	# cut the date in the first 23 character of the line
	date=$(echo $line | cut -c1-23)
	# store the 6,7,8 column of a line in a variable
	descript=$(echo $line | awk -F':' '{ print $6":"$7":"$8}')
	# search the pattern GEAR and store the first 41 characters in the variable
	gearid=$(echo $line | grep -o 'GEAR.*'| cut -c1-41)
	# handel the lines without describtion string and print the failed job text
	jobfailed=$(echo $line | grep -o 'got Job with.*')
	
    # print the result and with i the nummer of failed line
	printf "********\n"
	printf "**$i**\n"
	printf "********\n"
	printf "Date:\t"
	printf "$date\n"
	printf "********\n"
	printf "description:\t"
	printf "$descript$jobfailed\n"
	printf "********\n"
	printf "********\n"
	printf "GEARID:\t"
	printf "$gearid\n"
	printf "*****************************************************\n"
	i=$((i+1))
done
