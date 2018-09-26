#!/bin/bash  
#===============================================================================
#
#          FILE: Test-UpdateFunc.sh
# 
#         USAGE: ./Test-UpdateFunc.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/05/2018 05:21
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcUpdate.sh

funcUpdate

exit 0
