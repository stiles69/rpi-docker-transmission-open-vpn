#!/bin/bash  
#==========================================================
#
#          FILE: Git-Bin-SH.sh
# 
#         USAGE: ./Git-Bin-SH.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/24/2018 06:15
#      REVISION:  ---
#==========================================================
set -o nounset                              # Treat unset variables as an error

#---------- SOURCED ---------
. $HOME/lib/sh/funcDisplayHostname.sh
#----------------------------

#---------- GLOBAL VARIABLES ---------
SPACE=" "
SYNCDIR=$HOME/Notes
HOSTNAME="$(DisplayHostname)"
COMMITMESSAGE="$HOSTNAME Bash"
#-------------------------------------
function ProceedYes ()
{
	# Commit First
	GitCommit "$SYNCDIR"
	wait

	# Pull Bin Notes
	Pull "$SYNCDIR"
	wait

	# Commit After Pull
	GitCommit "$SYNCDIR"
	wait

	# Push Bin Notes
	Push "$SYNCDIR"
	wait
}	# end function

function GitCommit ()
{
	local GITDIR="$1"
	if [ -d "$GITDIR" ]
	then	
		cd "$GITDIR"
		git add .
		git commit -m "$COMMITMESSAGE"
		echo "$COMMITMESSAGE"
	else
		echo "No directory $GITDIR, ending GitCommit."
	fi
}	# end function

function Push ()
{
	local GITDIR=$1
	if [ -d "$GITDIR" ]
	then
		cd "$GITDIR"
		git push
		echo "###############################################"
		echo "FINISHED PUSHING $GITDIR"
		echo "###############################################"
		echo $SPACE
	else
		echo "No directory $GITDIR, ending Push."
	fi
}	# end function

function Pull ()
{
	local GITDIR=$1
	if [ -d "$GITDIR" ]
	then
		cd "$GITDIR"
		git pull 
		echo "###############################################"
		echo "FINISHED PULLING $GITDIR"
		echo "###############################################"
		echo $SPACE
	else
		echo "No directory $GITDIR, ending Pull."
	fi
}	# end function

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0
