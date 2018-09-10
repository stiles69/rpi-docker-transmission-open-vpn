#!/bin/bash  
#===============================================================================
#
#          FILE: funcRemoveQuoteMarksFromFilenames.sh
# 
#         USAGE: ./funcRemoveQuoteMarksFromFilenames.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/11/2018 23:45
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function RemoveQuoteMarksFromFilenames ()
{
	renamer --find "'" --replace "" "*"
	renamer --find '"' --replace '' '*'
}	# end function
