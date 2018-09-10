#!/bin/bash  
#===============================================================================
#
#          FILE: funcCleanWholeDirectory.sh
# 
#         USAGE: ./funcCleanWholeDirectory.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/11/2018 22:49
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
. $HOME/lib/sh/funcRemoveQuoteMarksFromFilenames.sh
. $HOME/lib/sh/funcCleanSpacesFromFilenames.sh
. $HOME/lib/sh/funcCleanPeriodFromFilenames.sh
. $HOME/lib/sh/funcRemoveSpecialCharactersFromFilenames.sh
. $HOME/lib/sh/funcRemoveMultipleUnderlinesFromFilenames.sh

function CleanWholeDirectory
{
	
	RemoveSpecialCharactersFromFilenames
	wait
	RemoveMultipleUnderlinesFromFilenames
	wait
	RemoveQuoteMarksFromFilenames
	wait
	CleanPeriodFromFilenames
	wait
	CleanSpacesFromFilenames
	wait

}	# end function

