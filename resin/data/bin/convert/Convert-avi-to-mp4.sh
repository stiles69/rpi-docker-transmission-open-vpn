#!/bin/bash
#===============================================================================
#
#          FILE:  Convert-MP4-To-Webm.sh
# 
#         USAGE:  ./Convert-MP4-To-Webm.sh 
# 
#   DESCRIPTION:  Converts .mp4 file to webm.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  Need a folder named output where the converted files will be put.
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 06:28:39 PM CST
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
for i in *.avi;
do name=`echo $i | cut -d'.' -f1`;
	echo $name;
	ffmpeg -i "$i" "./output/$name.mp4";
done
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

