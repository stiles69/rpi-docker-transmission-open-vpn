#!/bin/bash
#===============================================================================
#
#          FILE: Pull-Zim-ALL.sh
# 
#         USAGE: ./Pull-Zim-ALL.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 00:22
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error


. $HOME/lib/sh/funcRunRemoteCommand.sh

COMMAND="$HOME/bin/Pull-Zim.sh"

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
	RunRemoteCommand "$MACHINENAME" "$COMMAND"
	wait
	echo "FINISHED SYNCING $MACHINENAME"
}	# end PullMachine

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0
