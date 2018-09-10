#!/bin/bash
#===============================================================================
#
#          FILE:  Normalize-M4A-To-MP3.sh
# 
#         USAGE:  ./Normalize-M4A-To-MP3.sh 
# 
#   DESCRIPTION:  Normalizes the sound level in a .m4a file and converts it to mp3.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  Must have an output folder named Converted.
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/05/2017 01:56:27 AM CST
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
for f in *.m4a;
do
	ffmpeg -i "$f" -af "volume=0dB" -codec:v copy -codec:a libmp3lame -q:a 2 Converted/"${f%.m4a}.mp3";
done
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

