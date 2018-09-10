#!/bin/bash  
#===============================================================================
#
#          FILE: Walk-Thru-Subdirectories-Example.sh
# 
#         USAGE: ./Walk-Thru-Subdirectories-Example.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/29/2018 01:47
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

shopt -s globstar

function Walk ()
{
	if [ ! -d "$PWD/Converted" ]
	then
		echo "Making directory Converted"
		mkdir Converted
	fi
for i in ./**/*
do
	if [ -f "$i" ];
	then        
		#printf "Path: %s\n" "${i%/*}" # shortest suffix removal
		#printf "Filename: %s\n" "${i##*/}" # longest prefix removal
		#printf "Extension: %s\n"  "${i##*.}"
		#printf "\n\n"
		#printf "Filesize: %s\n" "$(du -b "$i" | awk '{print $1}')"
	       	FILEEXT="${i##*.}"	
		FILENAME="${i##*/}"
		#NAME="$(echo "$FILENAME" | cut -d'.' -f1)"

		#echo "FILEXT is "$FILEEXT
		#echo "FILENAME is $FILENAME"
		#echo "NAME =  $NAME"

		if [ $FILEEXT = "mp3" ]
		then
			NAME="$(echo "$FILENAME" | cut -d'.' -f1)"
			ffmpeg -n -i "$i" -c:a libfdk_aac -vn "./Converted/$NAME.m4a"
			wait
		fi
	wait	
	fi
done
}	# End function

function Main ()
{
	Walk
}	# End function

Main

#== Exit ==
exit 0
