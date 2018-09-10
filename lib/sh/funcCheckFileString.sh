#!/bin/bash  
#===============================================================================
#
#          FILE: funcCheckFileString.sh
# 
#         USAGE: ./funcCheckFileString.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/07/2018 02:46
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
USAGE="Usage CheckFileString [STRINGTOCHECK] [PATH/TO/FILETOCHECK] ex. Must be the full path and the file."

function CheckFileString ()
{
	##To check for a particular  string in a file

	if [ {grep -q $1 $2} && echo $? = 0]
	then
		return 0
	else
		exit 1
	fi
} 	# end function

