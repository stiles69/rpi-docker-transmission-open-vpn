#!/bin/bash
#===============================================================================
#
#          FILE:  Extract-Audio-From-Webm.sh
# 
#         USAGE:  ./Extract-Audio-From-Webm.sh 
# 
#   DESCRIPTION:  This will extract the audio from a Webm Container in ogg format.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  04/02/2018 11:39:53 PM CDT
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
OrDir="."

mkdir $OrDir/Converted

find "$OrDir" -type f -exec /bin/bash -c \
	'f2=$(basename "$l"); \
	ffmpeg -i "$l" -vn -acodec copy "$OrDir/Converted/${f2%.*}.m4a" ' _ {} \;

#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0


