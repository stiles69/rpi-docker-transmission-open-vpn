#!/bin/bash  
#===============================================================================
#
#          FILE: funcCheckInstall.sh
# 
#         USAGE: ./funcCheckInstall.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/05/2018 19:25
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
function CheckInstall ()
{
	if [ "$#" -lt 1 ]
	then
		echo "Function CheckInstall is missing parameter."
		echo "Now exiting."
		exit 0
	else
		local PACKAGENAME=$1
	fi

	if [ $(dpkg-query -W -f='${Status}' $PACKAGENAME 2>/dev/null | grep -c "ok installed") -eq 0 ]
	then	  
		return 0
	else
		return 1
	fi 
} 	#end CheckInstall

