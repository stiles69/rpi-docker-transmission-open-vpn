#!/bin/bash
#====================================================
#
#          FILE: Run-Complete-DVD.sh
# 
#         USAGE: ./Run-Complete-DVD.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: YOUR NAME (), 
#  ORGANIZATION: 
#       CREATED: 07/18/2018 03:15
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
VIDEONAME="$1"

function ConvertVideo ()
{
	echo "What do want to have for the ISO image. It needs to be all capitals and no special characters?"
	read ISONAME
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
} # end


function Converter ()
{
	NAME="$(echo "$VIDEONAME" | cut -d'.' -f1)"
	ffmpeg -i "$VIDEONAME" -target ntsc-dvd -aspect 16:9 "temp.mpg"
}	# end Converter


function BuildTSFiles ()
{
		NAME="$(echo "$i" | cut -d'.' -f1)"
		echo "$NAME"
		dvdauthor -o ./OUTPUTDIR -t temp.mpg 
}	# end BuildTSFiles


function FinalizeDVD ()
{
	dvdauthor -o ./OUTPUTDIR -T
}	# end Main

function ProceedGenerateISOImage ()
{
		Generate "$ISONAME"
}

function Generate ()
{
	if [ -f /usr/bin/genisoimage ]
	then
	genisoimage -dvd-video -o "$ISONAME".iso ./OUTPUTDIR
else
	mkisoimage -dvd-video -o "$ISONAME".iso ./OUTPUTDIR
fi
} 

function Main ()
{
	ConvertVideo
	BuildTSFiles
	FinalizeDVD
	ProceedGenerateISOImage
}	# end Main
Main
#===EXIT===
exit 0
