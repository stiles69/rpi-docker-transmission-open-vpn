#!/bin/bash - 
#===============================================================================
#
#          FILE: Test-funcSyncronizeGooglecast.sh
# 
#         USAGE: ./Test-funcSyncronizeGooglecast.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 16:14
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcSyncronizeGooglecast.sh

SyncronizeGooglecast "$1"


