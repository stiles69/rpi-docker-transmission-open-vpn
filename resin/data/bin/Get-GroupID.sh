#!/bin/bash - 
#===============================================================================
#
#          FILE: Get-GroupID.sh
# 
#         USAGE: ./Get-GroupID.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/14/2018 04:37
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function Main ()
{
	$HOME/bin/Groups.sh
	echo "Which group do you want the id for:"
	read WANTEDGROUP
	getent group "$WANTEDGROUP" | cut -d: -f3
}	# end function

Main

#== EXIT ==
exit 0

