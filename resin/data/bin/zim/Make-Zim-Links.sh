#!/bin/bash  
#===============================================================================
#
#          FILE: Make-Zim-Links.sh
# 
#         USAGE: ./Make-Zim-Links.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 08/04/2018 01:18
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

function Main ()
{
	cd  /usr/lib/python2.7/site-packages/zim/plugins
	sudo rm -r ./zimclip
	sudo ln -s $HOME/.local/share/zim/plugins/zimclip
	cd /usr/share/zim
	sudo ln -s $HOME/bin/zim/templates
	cd ~	
}	# End Main

Main

#===EXIT===
exit 0
