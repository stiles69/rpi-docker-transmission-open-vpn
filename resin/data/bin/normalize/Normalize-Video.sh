#!/bin/bash
#===============================================================================
#
#          FILE:  Normalize-Video.sh
# 
#         USAGE:  ./Normalize-Video.sh 
# 
#   DESCRIPTION:  This will normalize the audio in videos.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  05/12/2018 09:45:06 AM CDT
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
VIDEO_FILE=$1
VIDEO_FILE_FIXED=${VIDEO_FILE%.*}-fixed.${VIDEO_FILE##*.}
avconv -i $VIDEO_FILE -c:a pcm_s16le -vn audio.wav
normalize-audio audio.wav
avconv -i $VIDEO_FILE -i audio.wav -map 0:0 -map 1:0 -c:v copy -c:a libvo_aacenc \
   $VIDEO_FILE_FIXED
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0
