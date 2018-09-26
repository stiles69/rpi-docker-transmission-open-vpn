#!/bin/bash
#=========================================================
#
#          FILE: Git-Push-LOCAL.sh
# 
#         USAGE: ./Git-Push-LOCAL.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 00:00
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error

GITPUSHDIR="$HOME/bin"

function PushDir ()
{
	cd "$GITPUSHDIR"
	git add .
	git commit -m "Update"
	echo "Done COMMITING $GITPUSHDIR"
}	# end function

function Main ()
{
	PushDir
}	# end Main

Main

#===EXIT===
exit 0
