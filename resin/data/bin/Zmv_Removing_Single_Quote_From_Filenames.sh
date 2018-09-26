#!/bin/zsh
#===============================================================================
#
#          FILE: Zmv_Removing_Single_Quote_From_Filenames.sh
# 
#         USAGE: ./Zmv_Removing_Single_Quote_From_Filenames.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 13:27
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

autoload zmv
zmv -Q "(**/)(')(D)"

