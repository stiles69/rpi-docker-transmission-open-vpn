#/bin/bash
#===============================================================================
#
#          FILE: funcClean.sh
# 
#         USAGE: ./funcClean.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/11/2018 20:09
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
# For files in folder named /files
function CleanSpacesFromFilenames ()
{
	renamer --find " " --replace "" "*"
	renamer --find "  " --replace "" "*"

}	# end function

