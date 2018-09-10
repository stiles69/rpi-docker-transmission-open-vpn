#!/bin/bash  
#===============================================================================
#
#          FILE: Clone-SH.sh
# 
#         USAGE: ./Clone-SH.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/28/2018 10:06
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function MakeLib ()
{
	mkdir ~/lib
}	# End Function

function PullSH ()
{
	cd ~/lib
	git clone git@github.com:stiles69/sh.git
}	# End Function

function Main ()
{
	MakeLib
	PullSH
}	# End Function

Main

exit 0
