#!/bin/bash
#====================================================
#
#          FILE: Make-Netrc.sh
# 
#         USAGE: ./Make-Netrc.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/04/2018 18:13
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	echo "machine youtube login myaccount@gmail.com password my_youtube_password" > $HOME/.netrc
	chmod a-rwx,u+rw $HOME/.netrc
	echo "File Created at $HOME/.netrc you must change this."
}	# end Main

Main

#===EXIT===
exit 0

