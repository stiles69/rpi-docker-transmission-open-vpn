#!/bin/bash  
#===============================================================================
#
#          FILE: funcShowUsers.sh
# 
#         USAGE: ./funcShowUsers.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/23/2018 22:04
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DELIMITER="#########################################################"
showUSERS ()
{
	echo -e “Below are the user logged on the system:\n”

}	#--End showUsers

#Print a user’s details 
function printUSERDETS() {
	oldifs="$IFS"    #store old internal field separator
	IFS=:                 #specify a new internal field separator
	read -p "Enter user name to be searched:" uname   #read username
	echo ""
	#read and store from a here string values into variables using : as  a  field delimiter
	read -r username pass uid gid comments homedir shell <<< "$(cat /etc/passwd | grep   "^$uname")"
	#print out captured values
	echo  -e "Username is            : $username\n"
	echo  -e "User's ID                 : $uid\n"
	echo  -e "User's GID              : $gid\n"
	echo  -e "User's Comments    : $comments\n"
	echo  -e "User's Home Dir     : $homedir\n"
	echo  -e "User's Shell             : $shell\n"
	IFS="$oldifs"         #store old internal field separator
}

