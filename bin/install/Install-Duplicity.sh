#!/bin/bash  
#===============================================================================
#
#          FILE: Install-Duplicity.sh
# 
#         USAGE: ./Install-Duplicity.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (), brett.salemink@gmail.com
#  ORGANIZATION: Rogue Designs
#       CREATED: 06/24/2018 10:52
#      REVISION:  ---
#===============================================================================

set -o nounset                              # Treat unset variables as an error

DetermineOS ()
{
# Include Lib
. ~/lib/sh/funcOS.sh

# Use Function
#funcOS

RESULT=$(funcOS)

case $RESULT in
	
	"Debian")  
	echo "Installing For Debian/Based"    
	sudo apt-get install duplicity keychain
	;;

	"Raspbian GNU/Linux")  
	echo "Installing For Debian/Based"    
	sudo apt-get install duplicity keychain
	;;

	"Antergos Linux")  
	echo "Installing For Arch/Based"    
	yay -S duplicity keychain
	;;
	
	*)
	echo 'No match can not install'
	exit
	;;
esac
}

Main ()
{

	# Generate key under brettsalemink supposed to be under su.

	/home/brettsalemink/lib/sh/funcGenerateGPGKey.sh
	umask 077
	touch /home/brettsalemink/backup.sh /home/brettsalemink/.duplicity.conf
	sudo chmod u+x /home/brettsalemink/backup.sh
	sudo ls -la /home/brettsalemink/backup.sh /home/brettsalemink/.duplicity.conf
	echo 'Now check the permissions. First one should be:'
	echo '-rwx------  1 root root 0 2006-01-16 06:47 /home/brettsalemink/backup.sh'
	echo 'The second one:'
	echo '-rw-------  1 root root 0 2006-01-16 06:47 /home/brettsalemink/.duplicity.conf'
	echo 'Now you should have a password protected gpg public/private key pair.'
	gpg --list-secret-keys

	echo 'You should also have an ssh private/public key pair.'
	ls -la /home/brettsalemink/.ssh
	
	echo 'End of Main'
}

DetermineOS

# Exit
exit 0 
