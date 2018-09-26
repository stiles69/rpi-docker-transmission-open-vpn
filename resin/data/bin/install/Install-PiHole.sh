#!/bin/bash
#===============================================================================
#
#          FILE:  PiHole-Install.sh
# 
#         USAGE:  ./PiHole-Install.sh 
# 
#   DESCRIPTION:  This will install PiHole on a RaspberryPi. PiHole is a DNS server and ad blocker.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  05/06/2018 09:34:33 PM CDT
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
curl -sSL https://install.pi-hole.net | bash
#===============================================================================
#   STATISTICS / CLEANUP
#===============================================================================
exit 0


