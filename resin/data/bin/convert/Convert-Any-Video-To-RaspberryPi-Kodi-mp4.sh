#!/bin/bash  
#===============================================================================
#
#          FILE: Test-Walk2.sh
# 
#         USAGE: ./Test-Walk2.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 06:42
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

FILENAME="$1"
function GetFile ()
{
	if [ "$FILENAME" = null ]
	then
		echo "Please select the filename. Make sure you spell it exactly and it is in the same path as the $PWD. [ You can also select the filename as a commandline parameter ]"
		read FILENAME	
	fi
}

function MakeDir ()
{
	echo "What do you want to name the directory that the converted files will be located in? [$HOME/Kodi-Exports/????]"
	read OUTPUTDIR

	mkdir -p "Converted/$OUTPUTDIR"	
	
}	# end function

function Convert () 
{
		NAME=`echo "$FILENAME" | cut -d'.' -f1`
		echo "$NAME"
		NEWNAME="$NAME.mp4"
		
		/usr/bin/ffmpeg -i "$FILENAME" -vcodec libx264 -profile:v high -level 4.1 -preset fast -crf 18 -b-pyramid none \
    -acodec ac3 -ab 1536k -scodec copy "Converted/$OUTPUTDIR/$NEWNAME"
		wait	
}	# end function

function Main ()
{
	GetFile
	MakeDir
	Convert
}	# end function

Main

# == EXIT ==
exit 0
