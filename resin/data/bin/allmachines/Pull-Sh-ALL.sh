#!/bin/bash
#===============================================================================
#
#          FILE: Pull-Bin-ALL.sh
# 
#         USAGE: ./Pull-Bin-ALL.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/03/2018 22:33
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/lib/sh/funcRunRemoteCommand.sh

COMMAND="$HOME/bin/Pull-Sh.sh"

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
	echo "FINISHED SYNCING $MACHINENAME with $COMMAND"
}	# end PullMachine

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0
