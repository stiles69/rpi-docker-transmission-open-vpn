#!/bin/bash
#===============================================================================
#
#          FILE:  Decrypt-folder.sh
# 
#         USAGE:  ./Decrypt-folder.sh 
# 
#   DESCRIPTION:  Decrypts all gpg files in folder.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 06:35:24 PM CST
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
read -rsp "Enter passphrase: " PASSPHRASE

for FILE in *.*.gpg;
do
	echo "Extracting $FILE to ${FILE%.gpg}."
	echo "$PASSPHRASE" | gpg --passphrase-fd 0 --batch -d --output "${FILE%.gpg}" "$FILE"
done
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

