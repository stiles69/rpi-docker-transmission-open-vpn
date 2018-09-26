#!/bin/bash  
#====================================================
#
#          FILE: Make-Default-Directories.sh
# 
#         USAGE: ./Make-Default-Directories.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 05/07/18 11:32
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
SCRIPTDEFINITION="This will make default Home directories."
function Proceed ()
{
	echo $SCRIPTDEFINITION
	echo "Do you want to proceed? [Y/n]"
	read PROCEED
	case $PROCEED in
		"Y"|"y")
		ProceedYes
		;;
		"N"|"n")
		ProceedNo
		;;
		*)
		ProceedYes
		;;
	esac
}	# end function

function ProceedYes ()
{
	if [ -d $HOME/Videos ]
	then
		echo "Videos already exists."
	else
		mkdir $HOME/Videos
	fi
	

	if [ -d $HOME/development/stiles69 ]
	then
		echo "Stiles69 already exists."
	else
		mkdir -p $HOME/development/stiles69
	fi

	if [ -d $HOME/Downloads ]
	then
		echo "Downloads directory already exists."
	else
		mkdir $HOME/Downloads
	fi
}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function Main ()
{
	Proceed
}	# end Main

Main # Call Main

# == Exit ==
exit 0	# Always exit properly
