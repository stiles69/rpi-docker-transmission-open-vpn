#!/bin/bash - 
#===============================================================================
#
#          FILE: List-Flatpak-Repos.sh
# 
#         USAGE: ./List-Flatpak-Repos.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/13/2018 12:04
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

flatpak remotes --show-details | awk '{print "echo \"echo \\\x22$(base64 --wrap=0 < $HOME/.local/share/flatpak/repo/" $1 ".trustedkeys.gpg)\\\x22 | base64 -d | flatpak remote-add --if-not-exists --gpg-import=- --prio=\\\x22"$4"\\\x22 --title=\\\x22"$2"\\\x22 --user \\\x22"$1"\\\x22 \\\x22"$3"\\\x22\""}' | sh


