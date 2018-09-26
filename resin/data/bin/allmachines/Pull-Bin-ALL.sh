#!/bin/bash
#=========================================================
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
#=========================================================
set -o nounset                              # Treat unset variables as an error
set -e
. $HOME/lib/sh/funcRunRemoteCommand.sh

COMMAND="$HOME/bin/Pull-Bin.sh"

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
	ssh "$MACHINENAME" "bash -s" "$COMMAND"	
	#RunRemoteCommand "$MACHINENAME" "$COMMAND"
	wait
}	# end PullMachine

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0
