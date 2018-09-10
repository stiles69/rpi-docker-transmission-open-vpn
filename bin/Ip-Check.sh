#!/bin/bash
#==========================================================================
#
#          FILE:  ip-check.sh
# 
#         USAGE:  ./ip-check.sh 
# 
#   DESCRIPTION:  Checks where the connection to the internet is, i.e. is it VPN?
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  03/02/2018 10:10:12 PM CST
#      REVISION:  1.0
#==========================================================================
set -o nounset                                  # treat unset variables as errors

wget -q -O - ipecho.net/plain

#===EXIT===
exit 0
