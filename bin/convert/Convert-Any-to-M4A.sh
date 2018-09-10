#!/bin/bash
#===============================================================================
#
#          FILE:  Convert-Any-To-MP3.sh
# 
#         USAGE:  ./Convert-Any-To-MP3
# 
#   DESCRIPTION:  Converts Any files to m4a files.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  OrDir is the output directory.
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 06:22:27 PM CST
#      REVISION:  ---
#===============================================================================

set -o nounset                                  # treat unset variables as errors

#===============================================================================
#   GLOBAL DECLARATIONS
#===============================================================================
declare -rx SCRIPT=${0##*/}                     # the name of this script
declare -rx mkdir='/bin/mkdir'                  # the mkdir(1) command

#===============================================================================
#   SANITY CHECKS
#===============================================================================
if [ -z "$BASH" ] ; then
	printf "$SCRIPT:$LINENO: run this script with the BASH shell\n" >&2
	exit 192
fi

if [ ! -x "$mkdir" ] ; then
	printf "$SCRIPT:$LINENO: command '$mkdir' not available - aborting\n" >&2
	exit 192
fi

#===============================================================================
#   MAIN SCRIPT
#===============================================================================
CURRENTDIR=$PWD
OUTPUTDIR="${CURRENTDIR}/Converted"

function Make_OutputDir () 
{
	echo 'Creating Dir ' $OUTPUTDIR
	mkdir "$OUTPUTDIR"
}	# End Function

function Get_Extension ()
{
	echo "What is the extension you want to look for and convert FROM ex. .mp4"
	read INPUTEXT
	FINDTEXT='*'$INPUTEXT
} # End Function

function Convert ()
{
	for i in *"$INPUTEXT";
		do name=`echo $i | cut -d'.' -f1`;
		echo $name;
		ffmpeg -i "$i" "./Converted/$name.m4a";
	done

}	# End Function Convert

function Delete_Old ()
{
	echo 'The Old files with the extension: ' $INPUTEXT
	echo 'The PWD is ' $PWD
	echo 'Do you wish to delete these? [Y/n]'
	read PROCEED2
	case PROCEED2 in
		"Y"|"y")
		find . -name "*$INPUTEXT" -delete
		;;

		"N"|"n")
		exit 0
		;;

		*)
		find . -name "*$INPUTEXT" -delete
		;;
	esac
} # End Function

function Sync_Converted () 
{
	rsync -rvz --progress "$OUTPUTDIR/" "$CURRENTDIR"
}	# End Function

function Delete_Converted () 
{
	sudo rm -r "$OUTPUTDIR"
}

function DoConvert ()
{

	echo 'The Dir to be Converted is: ' 
	echo $CURRENTDIR

	echo 'The Output Dir is: '
	echo $OUTPUTDIR

	echo 'Do you want to continue converting the music to .mp3? [Y/n]'
	read PROCEED

	case $PROCEED in

		"Y"|"y")
		Convert
		Sync_Converted
		Delete_Converted
		;;

		"N"|"n")
		exit 0
		;;

		*)
		Convert
		Sync_Converted
		Delete_Converted
		;;
esac
}	# End Function
function Main () 
{
	Make_OutputDir
	Get_Extension
	DoConvert
} # End Main
Main
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

