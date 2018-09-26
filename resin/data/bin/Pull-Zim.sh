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
. $HOME/lib/sh/funcSetPermissions.sh
#----------------------------

#---------- GLOBAL VARIABLES ---------
SYNCDIR=$HOME/development/stiles69/zim
HOSTNAME="$(DisplayHostname)"
COMMITMESSAGE="$HOSTNAME Bash"
#-------------------------------------
function ProceedYes ()
{
	# Commit First
	GitCommit "$SYNDIR"
	wait

	# Pull Bin zim
	Pull "$SYNCDIR"
	wait

	# Commit After Pull
	GitCommit "$SYNDIR"
	wait

	# Push Bin local
	Push "$SYNCDIR"
	wait
}	# end function

function GitCommit ()
{
	local GITDIR=$1
	if [ -d "$GITDIR" ]
	then
		cd "$GITDIR"
		git add .
		git commit -m "$COMMITMESSAGE"
		echo "Commited $COMMITMESSAGE"
	else
		echo "No directory $GITDIR ending GitCommit."
	fi
}	# end function

function Push ()
{
	local GITDIR=$1
	if [ -d "$GITDIR" ]
	then
		cd "$GITDIR"
		git push
		echo "#########################################################"
		echo "FINISHED PUSHING $GITDIR"
		echo "#########################################################"
		echo "               "
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
		echo "#########################################################"
		echo "FINISHED PULLING $GITDIR"
		echo "#########################################################"
		echo "               "
	else
		echo "No directory $GITDIR, ending Pull."
	fi
}	# end function

function PermissionsSet ()
{
	local GITDIR="$1"
	if [ -d "$GITDIR" ]
	then
		SetPermissions "$GITDIR"
		echo "#########################################################"
		echo " FINISHED SETTING PERMISSION $GITDIR"
		echo "#########################################################"
		echo "               "
	else
		echo "No directory $GITDIR, ending PermissionsSet."
	fi
}	# end function

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0
