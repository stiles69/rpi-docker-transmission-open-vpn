#!/bin/bash  
#====================================================
#
#          FILE: Install-Vim-HTML5-Plugin.sh
# 
#         USAGE: ./Install-Vim-HTML5-Plugin.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/17/2018 18:58
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------

function Install ()
{
	cd $HOME/.vim/bundle
	git clone https://github.com/othree/html5.vim
}	# end

function Main ()
{
	Install
}	# end Main

Main

#===EXIT===
exit 0

