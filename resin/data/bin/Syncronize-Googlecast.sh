#!/bin/bash - 
#===============================================================================
#
#          FILE: Syncronize-Googlecast.sh
# 
#         USAGE: ./Syncronize-Googlecast.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 16:05
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function SyncronizeGooglecast ()
{
	MYVIDEO="$1"

	ffmpeg -i "$MYVIDEO" -s -keyint_min 150 -g 150 -f webm -vf setsar=1:1 "$MYVIDEO.webm"


}	# end function

