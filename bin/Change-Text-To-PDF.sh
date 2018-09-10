#!/bin/bash  
#=====================================================
#
#          FILE: Change-Text-To-PDF.sh
# 
#         USAGE: ./Change-Text-To-PDF.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/18/2018 20:45
#      REVISION:  ---
#======================================================
set -o nounset                              # Treat unset variables as an error

INPUTFILE="$1"
echo "$INPUTFILE"

function Convert ()
{
	USAGE="This script takes one parameter, a text file and converts it to a PDF file. Chancge-Text-To-PDF.sh TEXTFILE-TO-CONVERT"
	
	if [ ! -f "$INPUTFILE" ]
	then
		echo "Missing parameter $USAGE"
		echo "Exiting"
		exit 1
	else
		NAME=`echo $INPUTFILE | cut -d'.' -f1`
		vim "$INPUTFILE" -c "hardcopy > "$NAME".ps | q"; ps2pdf "$NAME".ps
	fi
}	# end function

function Main ()
{
	Convert
}	# end Main

Main

#==EXIT==
exit 0
