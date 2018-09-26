#!/bin/bash
#=====================================================
#
#          FILE: Pull-Sh.sh
# 
#         USAGE: ./Pull-Sh.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/03/2018 22:05
#      REVISION:  ---
#======================================================
set -o nounset                              # Treat unset variables as an error
#---------- SOURCED ---------
. $HOME/lib/sh/funcDisplayHostname.sh
. $HOME/lib/sh/funcSetPermissions.sh
#----------------------------

#---------- GLOBAL VARIABLES ---------
SPACE="            "
SYNCDIR=$HOME/lib/sh
HOSTNAME="$(DisplayHostname)"
COMMITMESSAGE="$HOSTNAME Bash"
#-------------------------------------

function ProceedYes ()
{
	# Git Commit
	GitCommit "$SYNCDIR"
	wait

	# Pull SYNCDIR
	Pull "$SYNCDIR"
	wait

	# Set Permissions SYNCDIR
	PermissionsSet "$SYNCDIR"
	wait

	# Git Commit
	GitCommit "$SYNCDIR"
	wait

	# Push SYNCDIR
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
		echo "No directory $GITDIR, ending GitCommit"
	fi
}	# end function

function Push ()
{
	local GITDIR="$1"
	if [ -d "$GITDIR" ]
	then
		cd "$GITDIR"
		git push
		echo "###################################################"	
		echo "FINISHED PUSHING $GITDIR"
		echo "###################################################"	
		echo "   "
	else
		echo "No directory $GITDIR, ending Push."
	fi
}	# end function

function Pull ()
{
	local GITDIR="$1"
	if [ -d "$GITDIR" ]
	then
		cd "$GITDIR"
		git pull 
		echo "#####################################################"	
		echo "FINISHED PULLING $GITDIR"
		echo "#####################################################"	
		echo "  "
	else
		echo "No directory $GITDIR, ending Pull."
	fi
}	# end function

function PermissionsSet ()
{
	local SETPERMISSIONSDIR="$1"
	if [ -d "$SETPERMISSIONSDIR" ]
	then
		SetPermissions "$SETPERMISSIONSDIR"
		echo "############################################################"	
		echo "FINISHED SETTING PERMISSIONS ON $SETPERMISSIONSDIR"
		echo "############################################################"	
		echo "   "
	else
		echo "No directory $SETPERMISSIONSDIR, ending PermissionsSet."
	fi
}	# end function

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0
