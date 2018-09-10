#!/bin/bash
#===============================================================================
#
#          FILE:  Initialize-Github.sh
# 
#         USAGE:  ./Initialize-Github.sh 
# 
#   DESCRIPTION:  This is from github.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  03/17/2018 06:51:57 AM CDT
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
echo "# vuetify-pwa-roguedesigns" >> README.md
git init
git add README.md
git commit -m "first commit"
git remote add origin https://github.com/stiles69/vuetify-pwa-roguedesigns.git
git push -u origin master
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0

