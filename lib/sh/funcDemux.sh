#!/bin/bash  
#===============================================================================
#
#          FILE: Ffmpeg-mp4-To-Googlecast.sh
# 
#         USAGE: ./Ffmpeg-mp4-To-Googlecast.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 15:10
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
function Demux ()
{
	# Must be MP4 Format
	PARAM1="$1"
	MYVIDEO=`echo $PARAM1 | cut -d'.' -f1`
	FILEEXT="${PARAM1##*.}"	
	if [ "$FILEEXT" = "mp4" ]
	then

		ffmpeg -i "$MYVIDEO.mp4" -vcodec copy -vn "myvideo_video.mp4"
		ffmpeg -i "$MYVIDEO.mp4" -acodec copy -vn "myvideo_audio.m4a"
	else
		echo "Wrong extension must be mp4"
		exit 0
	fi

}	# end function
