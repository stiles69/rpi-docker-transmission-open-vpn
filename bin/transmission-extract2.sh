#!/bin/bash
#====================================================
#
#          FILE:  transmission-extract.sh
# 
#         USAGE:  ./transmission-extract.sh 
# 
#   DESCRIPTION:  This will extract rar files when done downloading.
# 
#       OPTIONS:  ---
#  REQUIREMENTS:  ---
#          BUGS:  ---
#         NOTES:  ---
#        AUTHOR:  Brett Salemink (), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  06/21/2018 11:38:11 PM CDT
#      REVISION:  ---
#====================================================
#---------- SOURCED ---------

#----------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	find /torrents -name '*.rar' -execdir unrar e -o- {} \; 
	wait
	echo "Finished unrar" > ~/Transmission-Extract2.Log
	find /torrents -name '*.mp4' -name '*.avi' -name '*.mkv' -execdir mv -t /completed {} +;
	wait
	echo "Finished Moving to /Completed" >> ~/Transmission-Extract2.Log
	find /torrents -name '*.mp4' -name '*.avi' -name '*.mkv' -exec mv -t /completed {} +;
	wait
	echo "Finished Moving to /Completed" >> ~/Transmission-Extract2.Log
}	# end Main

Main

#===EXIT===
exit 0
