#!/bin/bash 
#=========================================================
#
#          FILE: Input-Text-File-Into-Array.sh
# 
#         USAGE: ./Input-Text-File-Into-Array.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/11/2018 17:17
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
LINE=' '

#-------------------------------------
function Main ()
{
	counter=0
	readarray a < testinput.txt
	cat testinput.txt | while read myline; 
	do
		echo value is: ${a[$counter]}
    		counter=$(($counter+1))
	done
}	# end Main

Main

#===EXIT===
exit 0

