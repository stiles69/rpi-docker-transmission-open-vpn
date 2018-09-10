#!/bin/bash  
#===============================================================================
#
#          FILE: Run-kdenlive-scripts.sh
# 
#         USAGE: ./Run-kdenlive-scripts.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 07/17/2018 22:44
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function RunAllKdenLiveScripts ()
{
	cd $HOME/.cache/kdenlive/scripts
	for i in *.sh
	do
		echo "Running "$i""
		sh ./"$i"
		wait
		echo ""$i" Completed"
		mv "$i" ./"$i".completed
	done
}	# end function

function Main ()
{
	RunAllKdenLiveScripts
}	# end Main

Main

#==EXIT==
exit 0
