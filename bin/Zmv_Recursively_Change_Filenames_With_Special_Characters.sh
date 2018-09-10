#!/bin/zsh
#===============================================================================
#
#          FILE: Zmv_Recursively_Change_Filenames_With_Special_Characters.sh
# 
#         USAGE: ./Zmv_Recursively_Change_Filenames_With_Special_Characters.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 13:17
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

autoload zmv $ chars='[][?=+<>;",-]' $ zmv '(**/)()' '$1${2//$~chars/%}'

