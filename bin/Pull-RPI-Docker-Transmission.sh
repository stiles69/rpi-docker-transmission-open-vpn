#!/bin/bash  
#====================================================
#
#          FILE: Pull-RPI-Docker-Transmission.sh
# 
#         USAGE: ./Pull-RPI-Docker-Transmission.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/05/2018 10:48
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

SYNCDIR=$HOME/development/Docker/rpi-docker-transmission-open-vpn

COMMITMESSAGE="$HOSTNAME Bash"

. $HOME/lib/sh/funcDisplayHostname.sh
. $HOME/lib/sh/funcSetPermissions.sh

HOSTNAME="$(DisplayHostname)"

function ProceedYes ()
{
	# Commit Changes First
	GitCommit "$SYNCDIR"
	wait

	# Pull SYNCDIR
	Pull "$SYNCDIR"
	wait

	# Push SYNCDIR
	Push "$SYNCDIR"
	wait

	# Set Permissions SYNCDIR
#	PermissionsSet "$SYNCDIR"
}	# end function

GitCommit()
{
	local GITDIR=$1
	cd $GITDIR
	git add .
	git commit -m "$COMMITMESSAGE"
	echo "Commited $COMMITMESSAGE"
}	# end

function GitPushLocal ()
{
	$HOME/bin/git/Git-Push-Bin-LOCAL.sh
}	# end function

function Push ()
{
	local GITDIR=$1
	COMMITMESSAGE="$HOSTNAME Bash"
	cd "$GITDIR"
	git add .
	git commit -m "$COMMITMESSAGE"
	git push
	echo "Done pushing $GITDIR"
}	# end function

function Pull ()
{
	local GITDIR=$1
	cd "$GITDIR"
	git pull --rebase
	echo "Done pulling $GITDIR"
}	# end function

function PermissionsSet ()
{
	local GITDIR="$1"
	SetPermissions "$GITDIR"
}	# end function

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0

