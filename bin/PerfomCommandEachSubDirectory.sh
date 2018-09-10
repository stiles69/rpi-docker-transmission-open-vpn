#!/bin/bash  
#===============================================================================
#
#          FILE: PerfomCommandEachSubDirectory.sh
# 
#         USAGE: ./PerfomCommandEachSubDirectory.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/12/2018 11:24
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

SCRIPTDEFINITION="Recurse through all Subdirectories below this one and perform the following command: $CUSTOMCOMMAND"

function Proceed ()
{
	if [ "$#" -lt 1 ]
	then
		echo "Need one parameter which is the command to run."
		echo "Now exiting."
		exit 0
	else
		local CUSTOMCOMMAND=$1
	fi

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
	Recurse $CUSTOMCOMMAND
}	# end function

function ProceedNo ()
{
	exit 0 # default action is exit for no
}	# end function

function Recurse ()
{
	for d in [0-9][0-9][0-9]
	do
		( cd $D && $CUSTOMCOMMAND )
	done
}	# end function

function Main ()
{
	Proceed
}	# end Main

Main

# == Exit ==
exit 0
