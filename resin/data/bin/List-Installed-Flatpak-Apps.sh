#!/bin/bash - 
#===============================================================================
#
#          FILE: List-Installed-Flatpak-Apps.sh
# 
#         USAGE: ./List-Installed-Flatpak-Apps.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/13/2018 12:05
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

flatpak list --app --show-details | awk '{print "flatpak install --assumeyes --user \""$2"\" \""$1}' | \cut -d "/" -f1 | awk '{print $0"\""}'

