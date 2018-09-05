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
	echo 'transmission-extract.sh started' > Transmission-Extract-Log.txt
	wait
	find . -name '*.rar' -execdir unrar e -o- {} \; 
	find . -name '*.mp4' -exec mv -t completed {} +
	find . -name '*.mkv' -exec mv -t completed {} +
	find . -name '*.avi' -exec mv -t completed {} +
	find . -name '*.mpg' -exec mv -t completed {} +
	find . -name '*.wmv' -exec mv -t completed {} +
	find . -name '*.mpeg' -exec mv -t completed {} +
	find . -name '*.flv' -exec mv -t completed {} +
}	# end Main

Main

#===EXIT===
exit 0
