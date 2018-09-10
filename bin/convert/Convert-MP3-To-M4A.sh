#!/bin/bash
#===============================================================================
#
#          FILE:  Convert-mp3-To-m4a.sh
# 
#         USAGE:  ./Convert-mp3-To-m4a.sh 
# 
#   DESCRIPTION:  Converts .mp3 files to m4a files.
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
mkdir ./Converted

function DeleteOldFiles ()
{

	find . -maxdepth 1 -name "*.mp3" -delete
}	# end function


function CleanUp ()
{
	DeleteOldFiles
	rsync -rvz --progress ./Converted/ ./
	wait
	sudo rm -r "./Converted"
}	# end function

function Convert () 
{
	for i in *.mp3
	do 
		name=`echo $i | cut -d'.' -f1`
		ffmpeg -i "$i" -c:a libfdk_aac -vn "./Converted/$name.m4a"
		echo "$name"
	done
}	# end function

function Main ()
{
	Convert
	CleanUp
}	# end main

Main
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0
#for i in *.mp4;
#do name=`echo $i | cut -d'.' -f1`;
#	echo $name;
#	ffmpeg -i "$i" "./output/$name.webm";
#done



		#ffmpeg -i "$i" -c:a libfdk_aac -vn ./Converted/"$name".m4a
