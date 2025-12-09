#!/bin/awk -f
#Caleb Javier - 00252855
#This is a test script for the awk command. It will manipulate the text in the AwkLab.data file in this directory to output a specific result.

#To begin, we will set some variables that we'll need to work with to condense and simplify code, using the BEGIN function:

#These functions will allow for the simplifying of code written.
function sum(a, b, c){
	return a + b + c
}
function avg (a, b, c){
	return (a + b + c) / 3
}

#the begin function will set the field separator in order to support the way the text is parsed.
BEGIN{
	FS=":";
	print "Awk Script Results:";
}



#This script will print the first name of all Tooks plus the sum of their contribution numbers.

/Took/{
	sum1 = sum($3, $4, $5);
	split($1, firstname, " "); print "a.", firstname[1], sum1;
	next;
}


#This script will print the full names and separate contributions of all whose last contribution was between $10 and $20.

$5 >= 10 && $5 <= 200 {
	print "b.", $1, $3, $4, $5;
	next;
}

#This script will print the full names and average contributino of those who contributed less than $300 on average.


($3 + $4 + $5)/3 < 300 {
	avg1 = avg($3, $4, $5);
	print "c.", $1, avg1;
}
