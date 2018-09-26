#!/bin/bash
#======================================================
#
#          FILE: Pull-Bin.sh
# 
#         USAGE: ./Pull-Bin.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/03/2018 22:04
#      REVISION:  ---
#======================================================
set -o nounset                              # Treat unset variables as an error
#---------- SOURCED ---------
. $HOME/lib/sh/funcDisplayHostname.sh
. $HOME/lib/sh/funcSetPermissions.sh
#----------------------------

#---------- GLOBAL VARIABLES ---------
SYNCDIR=$HOME/development/stiles69/Hometown-Cab-Project
HOSTNAME="$(DisplayHostname)"
COMMITMESSAGE="$HOSTNAME Bash"
#-------------------------------------
function ProceedYes ()
{
	# Commit SYNCDIR
	GitCommit "$SYNCDIR"
	wait

	# Push SYNCDIR
	Push "$SYNCDIR"
	wait

	# Pull SYNCDIR
	Pull "$SYNCDIR"
	wait

	# Commit SYNCDIR
	GitCommit "$SYNCDIR"
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

function Fetch ()
{
	local GITDIR=$1
	if [ -d "$GITDIR" ]
	then
		cd "$GITDIR"
		git fetch
		echo "#######################################################"
		echo "FINISHED FETCHING $GITDIR"
		echo "#######################################################"
	else
		echo "No directory $GITDIR, ending Fetch."
	fi
}	# end

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
