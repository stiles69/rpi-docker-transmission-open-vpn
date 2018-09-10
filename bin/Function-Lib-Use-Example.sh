#!/bin/bash - 
#===============================================================================
#
#          FILE: test.sh
# 
#         USAGE: ./test.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/23/2018 22:08
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error
# Include Lib
. ~/lib/sh/funcShowUsers.sh
# Use Function
printUSERDETS
# Exit
exit 0

