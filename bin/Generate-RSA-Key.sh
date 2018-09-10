#!/bin/bash
#===============================================================================
#
#          FILE:  Generate-RSA-Key.sh
# 
#         USAGE:  ./Generate-RSA-Key.sh 
# 
#   DESCRIPTION:  Generates SSH Key with RSA
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 06:43:59 PM CST
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
mkdir ~/ssh
# Wait to finish
wait${!}
# Change permission on .ssh directory
chmod 700 ~/.ssh
# Generate RSA Key
ssh-keygen -t rsa -b 4096
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

