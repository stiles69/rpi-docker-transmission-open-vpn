#!/bin/bash  
#=========================================================
#
#          FILE: funcReadTextFileIntoArray.sh
# 
#         USAGE: ./funcReadTextFileIntoArray.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/11/2018 17:24
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error

function ReadTextFileIntoArray ()
{
	USAGE="This will take a text file that and read each line into an array and assign it a number. The output is . Where a is the line of text followed by a number."

	counter=0
	readarray a < testinput.txt
	cat testinput.txt | while read myline; 
	do
		echo value is: ${a[$counter]}
    		counter=$(($counter+1))
	done
	echo "${a[@]}"

}

