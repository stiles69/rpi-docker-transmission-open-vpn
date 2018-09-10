#!/bin/bash
#===============================================================================
#
#          FILE:  Recurse.sh
# 
#         USAGE:  ./Recurse.sh 
# 
#   DESCRIPTION:  This will recurse through directory and subdirectories.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  05/09/2018 11:10:52 AM CDT
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
for word in `ls -ltr |tail -n +2 |awk '{print $9}'`
do
  a=$(echo $word | tr '[a-z]' '[A-Z]')
  mv $word $a
  echo "Done Successfully"
done
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

