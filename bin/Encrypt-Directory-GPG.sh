#!/bin/bash
#===============================================================================
#
#          FILE:  Encrypt-Directory-GPG.sh
# 
#         USAGE:  ./Encrypt-Directory-GPG.sh 
# 
#   DESCRIPTION:  This will encrypt each file with a key that must be hardcoded. Then will erase the old file
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  05/07/2018 04:30:26 AM CDT
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
shopt -s globstar
for file in $(pwd)/**
do
    gpg -r brett.salemink@gmail.com -o $file.gpg -e $file;
    rm $file
done


#for x in *; do 
#  gpg -r (yourencrytionkey.com) -o $x.pgp -e $x;
#  rm $x
#done
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0
