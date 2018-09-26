#!/bin/bash
#=========================================================
#
#          FILE:  WGet-Complete-Website.sh
# 
#         USAGE:  ./WGet-Complete-Website.sh 
# 
#   DESCRIPTION:  This will download a complete website.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/05/2017 02:14:01 AM CST
#      REVISION:  ---
#=========================================================
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
echo "Please enter the FULL website address including the http: "

read webAddress

wget -X 'Contents-amd64.gz' --wait=5 --limit-rate=5000K -r -p -U Mozilla $webAddress
echo 'All Done!'
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

