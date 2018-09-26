#!/bin/bash 
#====================================================
#
#          FILE: Install-Vim-VimVue-Plugin.sh
# 
#         USAGE: ./Install-Vim-VimVue-Plugin.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/17/2018 19:06
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	cd $HOME/.vim/bundle
	git clone https://github.com/posva/vim-vue

}	# end Main

Main

#===EXIT===
exit 0

