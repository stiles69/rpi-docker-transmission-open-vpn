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
SPACE=" "
SYNCDIR=$HOME/Notes
HOSTNAME="$(DisplayHostname)"
#-------------------------------------
function ProceedYes ()
{
	# Push Local First
	GitCommit "$SYNCDIR"
	wait

	# Pull Bin Notes
	Pull "$SYNCDIR"
	wait

	# Push Bin Notes
	Push "$SYNCDIR"
	wait
}	# end function

function GitCommit ()
{
	local GITDIR="$1"	
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
	echo "###############################################"
	echo "FINISHED PUSHING $GITDIR"
	echo "###############################################"
	echo $SPACE
}	# end function

function Pull ()
{
	local GITDIR=$1
	cd "$GITDIR"
	git pull 
	echo "###############################################"
	echo "FINISHED PULLING $GITDIR"
	echo "###############################################"
	echo $SPACE
}	# end function

function Main ()
{
	ProceedYes
}	# end function Main
Main

#== EXIT ==
exit 0
