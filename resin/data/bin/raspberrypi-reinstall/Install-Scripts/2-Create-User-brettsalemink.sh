#!/bin/bash  
#=========================================================
#
#          FILE: 1-Create-User-brettsalemink.sh
# 
#         USAGE: ./1-Create-User-brettsalemink.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/01/2018 18:17
#      REVISION:  ---
#=========================================================

set -o nounset                              # Treat unset variables as an error

function GetCurrentGroups ()
{
	cd ~/
	groups > groups.txt
	sed 's/ /,/g' groups.txt > groups2.txt
}	# end function

function MakeUser ()
{
	echo "What is the username for the new user?"
	read USERNAME
	sudo useradd -m "$USERNAME"
	sudo passwd "$USERNAME"
	sudo usermod -aG $(cat groups2.txt) "$USERNAME"
	sudo usermod -aG sudo "$USERNAME"

}	# end function

function CleanUp ()
{
	cd ~/
	rm groups.txt
	rm groups2.txt
}	# end function

function Proceed ()
{
	echo "This will make a new user with with all the groups privlegdes of your user now and sudo. Do you wish to Proceed? [Y/n]"
	read PROCEED

	case $PROCEED in
		Y|y)
		GetCurrentGroups
		MakeUser
		CleanUp
		;;
		N|n)
		echo "Exiting now..."
		exit 0
		;;
		*)
		echo "Invalid response. Exiting.."
		exit 1
		;;
	esac
}	# end function

function Main ()
{
	Proceed
}	# end function

Main

#==EXIT==
exit 0
