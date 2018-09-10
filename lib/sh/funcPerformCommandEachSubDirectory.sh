#!/bin/bash  
#===============================================================================
#
#          FILE: PerfomCommandEachSubDirectory.sh
# 
#         USAGE: ./PerfomCommandEachSubDirectory.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 11:24
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"

function PerformCommandEachSubDirectory ()
{
	if [ "$#" -lt 1 ]
	then
		echo "You need at least one arguement which is the command."
		exit 0
	else
		CUSTOMCOMMAND="$1"
		for d in [0-9][0-9][0-9]
		do
			( cd $D && $CUSTOMCOMMAND )
		done
	fi
}	# end function
