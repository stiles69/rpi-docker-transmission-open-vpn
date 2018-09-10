#!/bin/bash  
#=========================================================
#
#          FILE: rr.sh
# 
#         USAGE: ./rr.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/07/2018 02:18
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error
function rr ()
{
	while IFS='' read -r line || [[ -n "$line" ]]; 
	do    
		echo "Text read from file: $line"
	done < "$1"
}	# end Main

