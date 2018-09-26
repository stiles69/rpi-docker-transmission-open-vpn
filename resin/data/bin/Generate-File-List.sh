#!/bin/bash - 
#===============================================================================
#
#          FILE: Generate-File-List.sh
# 
#         USAGE: ./Generate-File-List.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 29/06/18 06:50
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


function TrimFilenames ()
{
	for i in ./*; 
		do mv "$i" "$(echo "$i" | tr -d "'")"; 
	done
}	# End function

function GenerateLoop ()
{
	echo "What is the extension of the media you want to Concantonate? ex. .mp4, .mkv, etc."
	read INPUTEXT
	
	for f in ./*$INPUTEXT; 
	do echo "file '$f'" >> inputlist.txt;
	done
}	# End Function

function Proceed ()
{
	echo "This will produce file list called inputlist.txt to be used in concating files with ffmpeg. Do you wish to Proceed? [Y/n]"
	read PROCEED

	case $PROCEED in
		"Y"|"y")
		GenerateLoop
		;;

		"N"|"n")
		GenerateLoop
		;;

		*)
		GenerateLoop
		;;
	esac
}	# End Function

function Main ()
{
	TrimFilenames
	Proceed
}	# End Function

Main
#== Exit ==
exit 0
