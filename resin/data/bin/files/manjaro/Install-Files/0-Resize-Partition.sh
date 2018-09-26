#!/bin/bash - 
#===============================================================================
#
#          FILE: 0-Resize-Partition.sh
# 
#         USAGE: ./0-Resize-Partition.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/01/2018 18:15
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function Resize ()
{
	sudo resize-sd
}	# end function

function Main ()
{
	Resize
}	# end function

Main

#==EXIT==
exit 0
