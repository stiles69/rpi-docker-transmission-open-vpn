#!/bin/bash - 
#===============================================================================
#
#          FILE: Test-Path.sh
# 
#         USAGE: ./Test-Path.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/29/2018 03:29
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function GetPWD ()
{
	result="$(echo -e "${PWD##*/}" | tr -d "[:space:]")"
	
	echo $result
}	# end function

function Main ()
{
	GetPWD
}	# end function

Main

# == exit ==
exit 0
