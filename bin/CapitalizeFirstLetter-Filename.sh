#!/bin/bash 
#===============================================================================
#
#          FILE: CapitalizeFirstLetter-Filename.sh
# 
#         USAGE: ./CapitalizeFirstLetter-Filename.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/15/2018 10:04
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

. $HOME/bin/Test-funcDisplayHostname.sh

function CapitalizeEveryFilenameInDirectory ()
{
	
	echo ${HOSTER} | awk '{print toupper(substr($0,0,1))tolower(substr($0,2))}'
	
	echo $HOSTER
}	# end function

function Main ()
{
	echo "This will change ALL the filenames to First Letter Capitalized. Do you want to proceed? [Y|n]"
	read PROCEED
	case $PROCEED in
		Y|y)
		CapitalizeEveryFilenameInDirectory
		;;
		N/n)
		echo "Exiting"
		;;
		*)
		echo "Invalid input. Exiting"
		;;;
	esac
}	# end Main

Main

#===EXIT===
exit 0

