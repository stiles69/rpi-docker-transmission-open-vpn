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
SYNCDIR=$HOME/development/docker
HOSTNAME="$(DisplayHostname)"
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
	#Pull "$SYNCDIR"
	wait

	# Fetch SYNCDIR
	#Fetch "$SYNCDIR"
	#wait

}	# end function

function GitCommit ()
{
	local GITDIR=$1
	cd "$GITDIR"
	git add .
	git commit -m "BASH"
}	# end function

function Push ()
{
	local GITDIR=$1
	COMMITMESSAGE="$HOSTNAME Bash"
	cd "$GITDIR"
	git add .
	git commit -m "$COMMITMESSAGE"
	git push
	echo "#########################################################"
	echo "FINISHED PUSHING $GITDIR"
	echo "#########################################################"
	echo "               "
}	# end function

function Pull ()
{
	local GITDIR=$1
	cd "$GITDIR"
	git pull 
	echo "#########################################################"
	echo "FINISHED PULLING $GITDIR"
	echo "#########################################################"
	echo "               "
}	# end function

function Fetch ()
{
	local GITDIR=$1
	cd "$GITDIR"
	git fetch
	echo "#######################################################"
	echo "FINISHED FETCHING $GITDIR"
	echo "#######################################################"
}	# end

function PermissionsSet ()
{
	local GITDIR="$1"
	SetPermissions "$GITDIR"
	echo "#########################################################"
	echo " FINISHED SETTING PERMISSION $GITDIR"
	echo "#########################################################"
	echo "               "
}	# end function

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0
