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
#------------ SOURCED ----------------
. $HOME/lib/sh/funcDisplayHostname.sh
. $HOME/lib/sh/funcSetPermissions.sh
#-------------------------------------

#---------- GLOBAL VARIABLES ---------
SYNCDIR=$HOME/development/Docker/rpi-docker-transmission-open-vpn
HOSTNAME="$(DisplayHostname)"
COMMITMESSAGE="$HOSTNAME Bash"
#-------------------------------------
function ProceedYes ()
{
	# Commit Changes First
	GitCommit "$SYNCDIR"
	wait

	# Pull SYNCDIR
	Pull "$SYNCDIR"
	wait

	# Commit Changes After Pull
	GitCommit "$SYNCDIR"
	wait

	# Push SYNCDIR
	Push "$SYNCDIR"
	wait
}	# end function

function GitCommit ()
{
	local GITDIR=$1
	if [ -d "$GITDIR" ]
	then
		cd $GITDIR
		git add .
		git commit -m "$COMMITMESSAGE"
		echo "Commited $COMMITMESSAGE"
	else
		echo "No directory $GITDIR, ending GitCommit."
	fi
}	# end

function Push ()
{
	local GITDIR=$1
	if [ -d "$GITDIR" ]
	then
		cd "$GITDIR"
		git push
		echo "#############################################"
		echo "Done pushing $GITDIR"
		echo "#############################################"
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
		git pull .
		echo "#############################################"
		echo "Done pulling $GITDIR"
		echo "#############################################"
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
	else
		echo "No directory $GITDIR, ending PermsissionsSet."
	fi
}	# end function

function Main ()
{
	ProceedYes
}	# end Main

Main

#===EXIT===
exit 0
