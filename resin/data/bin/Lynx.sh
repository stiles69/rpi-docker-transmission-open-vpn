#!/bin/bash  
#====================================================
#
#          FILE: Lynx.sh
# 
#         USAGE: ./Lynx.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/14/2018 05:37
#      REVISION:  ---
#====================================================
set -o nounset                              # Treat unset variables as an error
#------------ SOURCED ----------------

#-------------------------------------

#---------- GLOBAL VARIABLES ---------

#-------------------------------------
function Main ()
{
	echo 'Please enter your url:'
	read URL
	lynx -xhtml_parsing -underline_links -trace -sessionout=$HOME/.config/lynx/Sessionout -prettysrc -lss=$HOME/.config/lynx/lynx.lss -error_file=$HOME/.config/lynx/errorfile -enable_scrollback -cfg=/etc/lynx.cfg -cmd_log=$HOME/.config/lynx/cmd_log '$URL'
}	# end Main

Main

#===EXIT===
exit 0

