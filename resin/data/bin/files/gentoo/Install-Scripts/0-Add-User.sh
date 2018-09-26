#!/bin/bash  
#===============================================================================
#
#          FILE: 0-Add-User.sh
# 
#         USAGE: ./0-Add-User.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/01/2018 02:09
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function AddNewUser ()
{
	echo "What is the login name of the new user?"
	read NEWUSERNAME

	useradd --create-home --groups "adm,disk,lp,wheel,audio,video,cdrom,usb,users,plugdev,portage" --shell /bin/bash $NEWUSERNAME

	echo "Next password will be for new user."

	passwd $NEWUSERNAME

}	# end function

function Proceed ()
{
	echo "This will install a new user. Do you want to proceed? [Y/n]"
	read PROCEED

	case $PROCEED in
		"Y"|"y")
		AddNewUser
		;;

		"N"|"n")
		exit 0
		;;

		*)
		AddNewUser
		;;

	esac
}	# end function

function Main ()
{
	Proceed
	
}	# End function

Main

# == Exit ==
exit 0
