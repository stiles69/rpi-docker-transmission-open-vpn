#!/bin/bash 
#====================================================
#
#          FILE: Install-Vim-Dockerfile.sh
# 
#         USAGE: ./Install-Vim-Dockerfile.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/30/2018 14:43
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	cd ~/.vim/bundle
	git clone https://github.com/ekalinin/dockerfile.vim
}	# end Main

Main

#===EXIT===
exit 0

