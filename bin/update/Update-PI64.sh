#!/bin/bash  
#===============================================================================
#
#          FILE: Update-PI64.sh
# 
#         USAGE: ./Update-PI64.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 03:43
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------

set -o nounset                              # Treat unset variables as an error

function UpdatePI64-Raspbian ()
{
	sudo apt-get update -y
	sudo apt-get upgrade -y
	sudo apt-get dist-upgrade -y
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
	UpdatePI64-Raspbian
	UpdateBinLib
	UpdateNotes
	echo "DONE UPDATING PI64-RASPBIAN"
	echo "======================================="
}	# end Main
Main

#===EXIT===
exit 0

