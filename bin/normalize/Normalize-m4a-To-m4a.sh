#!/bin/bash
#===============================================================================
#
#          FILE:  Normalize-M4A-To-M4a.sh
# 
#         USAGE:  ./Normalize-M4A-To-M4a.sh 
# 
#   DESCRIPTION:  Normalizes the sound levels on a .m4a file.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  Must have a folder named Normalized.
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/05/2017 01:52:35 AM CST
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
	ffmpeg -i "$f" -af "volume=0dB" -c:a aac -b:a 192k -q:a 2 Normalized/"${f%.m4a}.m4a";
done
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

