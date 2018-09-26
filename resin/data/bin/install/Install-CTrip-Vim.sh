#!/bin/bash
#====================================================
#
#          FILE: Install-CTrip-Vim.sh
# 
#         USAGE: ./Install-CTrip-Vim.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/16/2018 09:43
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Install ()
{
	cd $HOME/.vim
	git clone https://github.com/kien/ctrlp.vim.git bundle/ctrlp.vim
}	# end

function SetVim ()
{
	echo "set runtimepath^=~/.vim/bundle/ctrlp.vim" >> $HOME/.vimrc
}	# end

function Main ()
{
	Install
	SetVim
}	# end Main

Main

#===EXIT===
exit 0
