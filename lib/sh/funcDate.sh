#!/bin/bash 
#===============================================================================
#
#          FILE: funcDate.sh
# 
#         USAGE: ./funcDate.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 02:34
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
function Date ()
{
	THEDATE="$(date)"
	echo "$THEDATE"
}	# end function
