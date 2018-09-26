#!/bin/bash
#===============================================================================
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
#===============================================================================

set -o nounset                              # Treat unset variables as an error
VIDEONAME="$1"

function ConvertVideo ()
{

	USAGE="This take one paramter a video file and converts to mpg with ffmpeg it can made into a DVD. 1-Make-DVD-Part-1.sh [FILETOCONVERT]"

#	echo "What do want to have for the ISO image. It needs to be all capitals and no special characters?"
#	read ISONAME
	
	if [ -d "./OUTPUTDIR" ]
		then
			sudo rm -r ./OUTPUTDIR
			mkdir ./OUTPUTDIR
		else
			mkdir ./OUTPUTDIR
	fi

	Converter
}	# end ConvertVideo

function Converter ()
{
	echo "Converting $VIDEONAME" > $HOME/makedvdlog.txt
	NAME="$(echo "$VIDEONAME" | cut -d'.' -f1)"
	ISONAME="$NAME"
	ffmpeg -i "$VIDEONAME" -filter:v "scale='if(gt(a,720/480),720,-1)':'if(gt(a,720/480),-1,480)',pad=w=720:h=480:x=(ow-iw)/2:y=(oh-ih)/2" -aspect 16:9 -target ntsc-dvd temp.mpg	
#	ffmpeg -i "$VIDEONAME" -target ntsc-dvd -aspect 16:9 "$NAME.mpg"
	wait
	echo "Finished Converting $VIDEONAME" >> $HOME/makedvdlog.txt
}	# end Converter

function BuildTSFiles ()
{
	for i in *.mpg
	do
		NAME="$(echo "$i" | cut -d'.' -f1)"
		echo "$NAME"
		echo "Building DVD Structure for $NAME.mpg" >> $HOME/makedvdlog.txt
		dvdauthor --title -o OUTPUTDIR -t temp.mpg
		wait
		echo "Completed DVD structure for $NAME.mpg" >> $HOME/makedvdlog.txt
	done	
}	# end BuildTSFiles


function FinalizeDVD ()
{
	echo "Finalizing DVD" >> $HOME/makedvdlog.txt
	dvdauthor -T -o OUTPUTDIR
	wait
	echo "Finished Finalizing DVD" >> $HOME/makedvdlog.txt
}	# end Main

function Generate ()
{
	echo "Generating ISO image for $ISONAME" >> $HOME/makedvdlog.txt 
	genisoimage -dvd-video -o "$ISONAME".iso OUTPUTDIR
	wait
	echo "Completed generating ISO image for $ISONAME" >> $HOME/makedvdlog.txt
}	# end Generate

function BurnISOToDisk ()
{
	growisofs -dvd-compat -Z /dev/dvd="$ISONAME.iso"
}	# end function

function Main ()
{
	ConvertVideo
	wait
	BuildTSFiles	
	wait
	FinalizeDVD
	wait
	Generate 
}	# end Main

Main
#=====EXIT=======
exit 0

