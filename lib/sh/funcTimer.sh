#!/bin/bash  
#===============================================================================
#
#          FILE: funcTimer.sh
# 
#         USAGE: ./funcTimer.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 03/07/18 06:08
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
function Timer () 
{
	COUNTDOWN=$1
	LONGCOMMAND=$2

	( sleep $COUNTDOWN ) & $LONGCOMMAND
	seconds=1
	while jobs %1 &>/dev/null ; do    
		echo $((seconds++)) "seconds complete"
		sleep 1    
	done
	
	echo "Done."
	
}	# end function

