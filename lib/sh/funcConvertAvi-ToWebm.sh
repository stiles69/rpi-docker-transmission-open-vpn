#!/bin/bash  
#===============================================================================
#
#          FILE: funcConvertAvi-ToWebm.sh
# 
#         USAGE: ./funcConvertAvi-ToWebm.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 17:12
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
function ConvertAviToWebm ()
{

	MYVIDEO="$1"
	ffmpeg -i "$MYVIDEO" -f webm -c:v libvpx -b:v 1M -acodec libvorbis "$MYVIDEO.webm"

}	# end function


