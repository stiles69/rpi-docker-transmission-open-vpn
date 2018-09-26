#!/bin/bash 
#====================================================
#
#          FILE: Install-Vim-GoLang.sh
# 
#         USAGE: ./Install-Vim-GoLang.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/22/2018 17:23
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
	git clone https://github.com/fatih/vim-go
}	# end

function Main ()
{
	Install
}	# end Main

Main

#===EXIT===
exit 0
