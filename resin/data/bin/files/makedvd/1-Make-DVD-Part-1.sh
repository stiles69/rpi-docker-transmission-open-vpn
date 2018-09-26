#!/bin/bash
#===============================================================================
#
#          FILE:  Make-DVD-Part-1.sh# 
#         USAGE:  
# 
#   DESCRIPTION:  Converts Movie to DVD.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES: 
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 06:39:37 PM CST
#      REVISION:  ---
#===============================================================================
#   MAIN SCRIPT
#===============================================================================
VIDEONAME="$1"

function ConvertVideo ()
{
	USAGE="This take one paramter a video file and converts to mpg with ffmpeg it can made into a DVD. 1-Make-DVD-Part-1.sh [FILETOCONVERT]"
	
	OUTPUTDIR="OUTPUTDIR"
	if [ ! -d "./OUTPUTDIR" ]
	then 
		mkdir ./"$OUTPUTDIR"
	fi

	if [ "$#" -lt1 ]
	then
		echo "$USAGE"
		ls
		echo "What is the filename you want to author a DVD from? [MyVideo.mp4]"
		read VIDEONAME
		Converter
	else
		Converter
	fi
}	# end ConvertVideo

function Converter ()
{
	NAME="$(echo "$VIDEONAME" | cut -d'.' -f1)"
	ffmpeg -i "$VIDEONAME" -target ntsc-dvd -aspect 16:9 "temp.mpg"
}	# end Converter

function AskContinue ()
{
	echo "Would you like to run the next part of the process automatically or manually? [1.Auto,2.Manual]"
	read ASKCONTINUE
	case $ASKCONTINUE in
		1)
		$HOME/bin/files/makedvd/2-Make-DVD-Part-2.sh
		;;
		2)
		echo "Okay, you will next need to run 2-Make-DVD-Part-2.sh"
		exit 0
		;;
		*)
		echo "Answer out of range. Exiting."
		exit 1
		;;
	esac
}	# end AskContinue

function Main ()
{
	ConvertVideo
	AskContinue
}	# end Main

Main

#== EXIT==
exit 0
