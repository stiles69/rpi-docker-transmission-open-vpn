#!/bin/bash
#===============================================================================
#
#          FILE:  Decrypt-Directory.sh
# 
#         USAGE:  ./Decrypt-Directory.sh 
# 
#   DESCRIPTION:  This will decrypt a directory. Must hard code the key.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  05/10/2018 03:41:57 AM CDT
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
    	gpg -d $file > ${file%.*};
	rm $file;
done


#for x in *; do 
#  gpg -r (yourencrytionkey.com) -o $x.pgp -e $x;
#  rm $x
#done
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0
