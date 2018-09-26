#!/bin/bash  
#======================================================
#
#          FILE: Set-Permissions-Bin.sh
# 
#         USAGE: ./Set-Permissions-Bin.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/03/2018 21:56
#      REVISION:  ---
#======================================================
set -o nounset                              # Treat unset variables as an error

SETPERMISSIONSDIR=$HOME/bin

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
