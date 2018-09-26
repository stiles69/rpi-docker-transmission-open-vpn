#!/bin/bash
#====================================================
#
#          FILE: Remove-Lubuntu-Desktop.sh
# 
#         USAGE: ./Remove-Lubuntu-Desktop.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/16/2018 02:09
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------
REMOVEPACKAGELIST="$HOME/bin/Remove-Lubuntu-Desktop-Packages-List.txt"
#-------------------------------------

function ReadArrayList ()
{
	counter=0
	readarray lubuntu < "$REMOVEPACKAGELIST"
	cat "$REMOVEPACKAGELIST" | while read myline; 
	do
    		counter=$(($counter+1))
	done
}	# end Main

function RemovePackages ()
{

	tLen=${#lubuntu[@]}
	# use for loop read all nameservers
	for (( i=0; i<${tLen}; i++ ));
	do
			sudo apt-get purge ${lubuntu[$i]}
			wait
	done	
}	# end

function Main ()
{
	ReadArrayList
	RemovePackages
}	# end Main

Main

#===EXIT===
exit 0
