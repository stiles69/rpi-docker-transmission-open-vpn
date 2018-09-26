#!/bin/bash
#===============================================================================
#
#          FILE:  Convert-Any-Audio.sh
# 
#         USAGE:  ./Convert-Any-Audio
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

function MakeOutputDir () 
{
	echo 'Creating Dir ' $OUTPUTDIR
	mkdir "$OUTPUTDIR"
}	# End Function

function GetInputExt ()
{
	echo "What is the extension you want to look for and convert FROM ex. .mp4"
	read INPUTEXT
	FINDTEXT='*'$INPUTEXT
} # End Function

function GetOutputExt ()
{
	echo "Please enter what type of audio output you would like to convert to? [ex. .mp4]"
	read OUTPUTEXT
}	# end function

function Convert ()
{
	for i in *;
		do name=`echo $i | cut -d'.' -f1`;
		echo $name;
		ffmpeg -i "$i" "./Converted/$name$OUTPUTEXT";
	done

}	# End Function Convert

function DeleteOld ()
{
	echo 'This will delete the files with the extension: '$INPUTEXT '. In Directory: '$CWD
	echo 'Do you wish to delete these? [Y/n]'
	read PROCEED2
	case PROCEED2 in
		"Y"|"y")
		find . -name "*$INPUTTEXT" -maxdepth 0 -delete
		;;
		"N"|"n")
		exit 0
		;;
		*)
		echo "Invalid answer. Exiting."
		exit 0
		;;
	esac
} # End Function

function SyncConverted () 
{
	rsync -rvz --progress "$OUTPUTDIR/" "$CURRENTDIR"
}	# End Function

function DeleteConverted () 
{
	echo "Do you want to delete "$OUTPUTDIR
	sudo rm -r "$OUTPUTDIR"
}

function Proceed ()
{
	echo "This will convert to $OUTPUTEXT format. Do you want to Proceed? [Y/n]"
	read PROCEED

	case $PROCEED in
		"Y"|"y")
		ProceedYes
		;;
		"N"|"n")
		echo "Exiting without converting."
		exit 0
		;;
		*)
		ProceedYes
		;;
	esac
}	# end function

function ProceedYes ()
{
		MakeOutputDir
		GetInputExt
		GetOutputExt
		Convert
		DeleteOld
		SyncConverted
		DeleteConverted

}	# end function


function Main () 
{
	Proceed
} # End Main
Main
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

