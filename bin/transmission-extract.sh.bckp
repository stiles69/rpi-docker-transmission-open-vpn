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
	find /torrents -name '*.mp4' -name '*.mkv' -name '*avi' -execdir mv -t /torrents/completed {} +;
}	# end Main

Main

#===EXIT===
exit 0
