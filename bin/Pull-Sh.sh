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
#-------------------------------------

function ProceedYes ()
{
	# Git Commit
	GitCommit "$SYNCDIR"
	wait


	# Push SYNCDIR
	Push "$SYNCDIR"
	wait


	# Pull SYNCDIR
	Pull "$SYNCDIR"
	wait
	
	# Set Permissions SYNCDIR
	PermissionsSet "$SYNCDIR"
}	# end function

function GitCommit ()
{
	local GITDIR="$1"
	cd "$GITDIR"
	git add .
	git commit -m "Bash"

}	# end function

function Push ()
{
	local GITDIR="$1"
	COMMITMESSAGE="$HOSTNAME Bash"
	cd "$GITDIR"
	git add .
	git commit -m "$COMMITMESSAGE"
	git push
	echo "###################################################"	
	echo "FINISHED PUSHING $GITDIR"
	echo "###################################################"	
	echo "   "
}	# end function

function Pull ()
{
	local GITDIR="$1"
	cd "$GITDIR"
	git pull 
	echo "#####################################################"	
	echo "FINISHED PULLING $GITDIR"
	echo "#####################################################"	
	echo "  "
}	# end function

function PermissionsSet ()
{
	local SETPERMISSIONSDIR="$1"
	SetPermissions "$SETPERMISSIONSDIR"
	echo "############################################################"	
	echo "FINISHED SETTING PERMISSIONS ON $SETPERMISSIONSDIR"
	echo "############################################################"	
	echo "   "
}	# end function

function Main ()
{
	ProceedYes
	echo "######"
	echo " DONE"
	echo "######"
	echo "  "
}	# end function Main
Main

#== EXIT ==
exit 0
