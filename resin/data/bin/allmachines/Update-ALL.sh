#!/bin/bash  
#=========================================================
#
#          FILE: Update-ALL.sh
# 
#         USAGE: ./Update-ALL.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 05:06
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error
set -e
. $HOME/lib/sh/funcRunRemoteCommand.sh
COMMAND="$HOME/bin/update/Update-Upgrade.sh"
SPACE=" "
function ProceedYes ()
{
	# Pull SYNCDIR Stretch
	PullMachine "stretch.roguedesigns.us" "$COMMAND"
	wait

	# Pull SYNCDIR Stiles
	PullMachine "stiles.roguedesigns.us" "$COMMAND"
	wait

	# Pull SYNCDIR Pi64
	PullMachine "pi64.roguedesigns.us" "$COMMAND"
	wait

	# Pull Manjaro
	PullMachine "manjaro.roguedesigns.us" "$COMMAND"
	wait
}	# end function

function PullMachine ()
{
	local MACHINENAME="$1"
	local COMMAND="$2"
	RunRemoteCommand "$MACHINENAME" "$COMMAND"
	wait
	echo "####################################################"
	echo "     FINISHED UPDATING $MACHINENAME"
	echo "####################################################"
	echo $SPACE
}	# end PullMachine

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0

