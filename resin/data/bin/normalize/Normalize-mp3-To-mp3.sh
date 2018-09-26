#!/bin/bash
#===============================================================================
#
#          FILE:  Normalize-MP3-To-MP3.sh
# 
#         USAGE:  ./Normalize-MP3-To-MP3.sh 
# 
#   DESCRIPTION:  Normalizes the sound levels in all the .mp3 files in a folder.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  Must have an output folder titled Normalized.
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/05/2017 01:59:38 AM CST
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
for f in *.mp3;
do
	ffmpeg -i "$f" -af "volume=0dB" -codec:v copy -codec:a libmp3lame -q:a 2 Normalized/"${f%.mp3}.mp3";
done
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

