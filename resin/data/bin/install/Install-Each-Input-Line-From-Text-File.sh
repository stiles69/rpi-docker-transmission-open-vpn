#!/bin/bash
#=========================================================
#
#          FILE: Install-Each-Input-Line-From-Text-File.sh
# 
#         USAGE: ./Install-Each-Input-Line-From-Text-File.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/11/2018 17:53
#      REVISION:  ---
#=========================================================
set -o nounset                              # Treat unset variables as an error
set -e
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------
LINE=' '

#-------------------------------------
function Main ()
{
	counter=0
	readarray a < $HOME/bin/files/manjaro/Native-Package-List.txt
	cat testinput.txt | while read myline; 
	do
		echo value is: ${a[$counter]}
		echo "Do you want to install this package? [Y/n]"
		read INSTALLPACKAGE
		case $INSTALLPACKAGE in
			Y|y)
			sudo pacman -S --needed "${a[$counter]}"
			counter=$(($counter+1))
			;;
			N|n)
			echo "${a[$counter]}" >> NOTINSTALLEDPACKAGES.txt
			counter=$(($counter+1))
			;;
			*)
			echo "Invalid answer. Skipping to next package."
			echo "${a[$counter]}" >> NOTINSTALLEDPACKAGES.txt
			counter=$(($counter+1))
			;;
		esac
    		counter=$(($counter+1))
	done
}	# end Main

Main

#===EXIT===
exit 0

