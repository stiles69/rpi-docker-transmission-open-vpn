#!/bin/bash  
#==========================================================
#
#          FILE: Update-Stretch.sh
# 
#         USAGE: ./Update-Stretch.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 03:50
#      REVISION:  ---
#==========================================================

set -o nounset                              # Treat unset variables as an error

#---------- SOURCED ---------
. $HOME/lib/sh/funcDisplayHostname.sh
#----------------------------

#---------- GLOBAL VARIABLES ---------
UPDATEHOSTNAME="$(DisplayHostname)"
#-------------------------------------
function Update ()
{
	sudo ucaresystem-core
#	sudo apt-get update -y
#	sudo apt-get upgrade -y
#	sudo apt-get dist-upgrade -y
}	# end function

function UpdateBinLib ()
{
	echo "Now Syncing ~/bin and ~/lib/sh."
	$HOME/bin/Pull-Bin-Sh.sh
	wait
	echo "Completed Syncing ~/bin and ~/lib/sh"
}	# end function

function UpdateNotes ()
{
	echo "Now Syncing ~/Notes"
	$HOME/bin/Pull-Notes.sh
	echo "Finished Syncing Notes."
	
}	# end function

function Main ()
{
	Update
	UpdateBinLib
	UpdateNotes
	echo "DONE UPDATING $UPDATEHOSTNAME"
	echo "======================================="
}	# end Main
Main

#===EXIT===
exit 0


