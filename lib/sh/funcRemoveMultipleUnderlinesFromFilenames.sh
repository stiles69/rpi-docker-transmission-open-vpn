#!/bin/bash  
#===============================================================================
#
#          FILE: funcRemoveUnderlinesFromFilenames.sh
# 
#         USAGE: ./funcRemoveUnderlinesFromFilenames.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 00:03
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


function RemoveMultipleUnderlinesFromFilenames ()
{
       	renamer --find "___" --replace "-" "*"
	wait
	renamer --find "__" --replace "-" "*"
	wait
	renamer --find "-" --replace "_" "*"	
	wait
}	# end function

