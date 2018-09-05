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
	DIR1="/torrents"
	DIR2="/data"
#-------------------------------------
function Main ()
{
#	echo 'transmission-extract.sh started' > $HOME/Transmission-Extract-Log.txt
	find /data -name '*.rar' -execdir unrar e -o- {} \; 
	find /torrents -name '*.rar' -execdir unrar e -o- {} \;
	find /torrents -name '*.mp4' -exec mv -t $DIR1/completed {} +
	find /torrents -name '*.mkv' -exec mv -t $DIR1/completed {} +
	find /torrents -name '*.avi' -exec mv -t $DIR1/completed {} +
	find /torrents -name '*.mpg' -exec mv -t $DIR1/completed {} +
	find /torrents -name '*.wmv' -exec mv -t $DIR1/completed {} +
	find /torrents -name '*.mpeg' -exec mv -t $DIR1/completed {} +
	find /torrents -name '*.flv' -exec mv -t $DIR1/completed {} +
	find /torrents -name '*.flac' -exec mv -t $DIR1/completed {} +

	#===Docker Dir ====
	find /torrents -name '*.mp4' -exec mv -t $DIR2/completed {} +
	find /torrents -name '*.mkv' -exec mv -t $DIR2/completed {} +
	find /torrents -name '*.avi' -exec mv -t $DIR2/completed {} +
	find /torrents -name '*.mpg' -exec mv -t $DIR2/completed {} +
	find /torrents -name '*.wmv' -exec mv -t $DIR2/completed {} +
	find /torrents -name '*.mpeg' -exec mv -t $DIR2/completed {} +
	find /torrents -name '*.flv' -exec mv -t $DIR2/completed {} +
	find /torrents -name '*.flac' -exec mv -t $DIR2/completed {} +
}	# end Main

Main

#===EXIT===
exit 0
