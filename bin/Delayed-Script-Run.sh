#!/bin/bash
#===============================================================================
#
#          FILE:  Delayed-Script-Run.sh
# 
#         USAGE:  ./Delayed-Script-Run.sh 
# 
#   DESCRIPTION:  This will wait then run script.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  03/05/2018 01:45:20 AM CST
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

function timeUP ()
{

echo 'Time Up!'



#rsync -avz --progress /home/brettsalemink/Downloads/Torrents/stretch/ brettsalemink@192.168.1.4:/torrents


}    # ----------  end of function timeUP  ----------


termdown 2m && timeUP
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0




