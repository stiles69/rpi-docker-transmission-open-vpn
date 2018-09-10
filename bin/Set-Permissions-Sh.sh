#!/bin/bash
#======================================================
#
#          FILE: Set-Permissions-Sh.sh
# 
#         USAGE: ./Set-Permissions-Sh.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/03/2018 21:59
#      REVISION:  ---
#======================================================
set -o nounset                              # Treat unset variables as an error


SETPERMISSIONSDIR=$HOME/lib/sh

function SetPermissions ()
{
	SETPERMISSIONSDIR=$1
	sudo chown -R brettsalemink:users $SETPERMISSIONSDIR
	sudo chmod -R 774 $SETPERMISSIONSDIR
	wait
	echo "Done setting permissions on $SETPERMISSIONSDIR"
}	# end function

function Main ()
{
	SetPermissions "$SETPERMISSIONSDIR"
}	# end Main

Main

#===EXIT===
exit 0
