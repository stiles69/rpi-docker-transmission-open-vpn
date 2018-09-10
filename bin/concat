#!/bin/bash  
#===============================================================================
#
#          FILE: Concatonate-Media-FFMPEG.sh
# 
#         USAGE: ./Concatonate-Media-FFMPEG.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 29/06/18 07:12
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

result="$(echo -e "${PWD##*/}" | tr -d "[:space:]")"

function Combine ()
{
	echo "What is the output filename including extension? ex. output.mp4"
	read OUTPUTFILENAME
	
	ffmpeg -f concat -safe 0 -i inputlist.txt -c copy $OUTPUTFILENAME
}	# End Function

function Main ()
{
	
	Combine
}	# End Function

Main

#== Exit ==
exit 0
