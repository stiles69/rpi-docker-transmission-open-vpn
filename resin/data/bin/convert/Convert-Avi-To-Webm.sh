#!/bin/bash  
#===============================================================================
#
#          FILE: Convert-Avi-To-Webm.sh
# 
#         USAGE: ./Convert-Avi-To-Webm.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 17:28
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcConvertAvi-ToWebm.sh

ConvertAviToWebm "$1"


