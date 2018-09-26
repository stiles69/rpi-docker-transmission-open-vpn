#!/bin/bash  
#===============================================================================
#
#          FILE: Update-Gentoo-PI64.sh
# 
#         USAGE: ./Update-Gentoo-PI64.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 03/07/18 07:38
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function UpdateGentoo ()
{
	sudo emerge --update --newuse --deep @world
	sudo emerge --ask --depclean
	sudo revdep-rebuild
	eclean-dist --deep && eclean-pkg --deep
}	# end UpdateGentoo

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

function UpdateZim ()
{
	echo "Syncing Zim"
	$HOME/bin/Pull-Zim.sh
	echo "Finished Exporting and Syncing."
}	# end function

function Main ()
{
	UpdateGentoo
	UpdateBinLib
	UpdateNotes
	echo "DONE UPDATING GENTOO PI64"
	echo "======================================="
}	# end Main
Main

#===EXIT===
exit 0
