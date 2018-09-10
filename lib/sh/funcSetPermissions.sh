#!/bin/bash
#======================================================
#
#          FILE: funcSetPermissions.sh
# 
#         USAGE: ./funcSetPermissions.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/03/2018 22:11
#      REVISION:  ---
#======================================================
set -o nounset                              # Treat unset variables as an error

USAGE="The correct usage of this function is funcSetPermissions.sh needs to be sourced and to call this function SetPermissions [The Directory to set permissions on.]"

function SetPermissions ()
{
	if [ "$1" ]
	then
		local SETPERMISSIONSDIR="$1"
		sudo chown -R brettsalemink:users "$SETPERMISSIONSDIR"
		sudo chmod -R 774 "$SETPERMISSIONSDIR"
	else
		echo "$USAGE"
		echo "Exiting..."
		exit 1
	fi
}

