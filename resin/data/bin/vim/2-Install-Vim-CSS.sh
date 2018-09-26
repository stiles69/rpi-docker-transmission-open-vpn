#!/bin/bash 
#====================================================
#
#          FILE: Install-Vim-CSS.sh
# 
#         USAGE: ./Install-Vim-CSS.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/22/2018 17:47
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error

#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Install ()
{
	cd ~/.vim/bundle
	git clone https://github.com/juleswang/css.vim
}	# end

function Main ()
{
	Install
}	# end Main

Main

#===EXIT===
exit 0
