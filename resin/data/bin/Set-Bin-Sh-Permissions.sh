#!/bin/bash - 
#===============================================================================
#
#          FILE: Set-Bin-Sh-Permissions.sh
# 
#         USAGE: ./Set-Bin-Sh-Permissions.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/24/2018 08:42
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

sudo chown -R brettsalemink:users ~/bin
sudo chmod -R 774 ~/bin
echo 'Permissions set on bin.'

sudo chown -R brettsalemink:users ~/lib
sudo chmod -R 774 ~/lib
echo 'Permissions set on lib.'

exit 0



