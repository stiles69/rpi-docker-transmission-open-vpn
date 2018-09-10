#!/bin/bash  
#===============================================================================
#
#          FILE: Find-All-SoftLinks.sh
# 
#         USAGE: ./Find-All-SoftLinks.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 01:08
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function Find ()
{
	echo "Enter the path to search for symbolic links or . for current dir:"
	read SEARCHPATH
	ls -lR "$SEARCHPATH" | grep ^l
}	# end function

function Main ()
{
	Find
}	# End Main

Main

#===EXIT===
exit 0
