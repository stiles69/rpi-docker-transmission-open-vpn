#!/bin/bash  
#===============================================================================
#
#          FILE: Test-PerformCommandEachDirectory.sh
# 
#         USAGE: ./Test-PerformCommandEachDirectory.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 11:43
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcPerfomCommandEachSubDirectory.sh

PerformCommandEachSubDirectory $HOME/bin/CleanWholeDirectory


