#!/bin/bash - 
#===============================================================================
#
#          FILE: Generate-SSH-Keys.sh
# 
#         USAGE: ./Generate-SSH-Keys.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/01/2018 01:21
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function GenerateKeys ()
{
	echo "What do you want to add to the comment section of the ssh keys? ex. Hostname."
	read COMMENT
	mkdir ~/.ssh
	chmod 700 ~/.ssh	
	ssh-keygen -t rsa -b 2048 -C $COMMENT
} 	# end function

function Proceed ()
{
	echo "This will create .ssh directory and ssh keys. Do you wish to proceed? [Y/n]"
	read PROCEED

	case $PROCEED in
		"Y"|"y")
		GenerateKeys
		;;

		"N"|"n")
		exit 0
		;;

		*)
		GenerateKeys
		;;
	esac
}	# end function

function Main ()
{
	Proceed
}	# end function

Main

# == Exit ==
exit 0
