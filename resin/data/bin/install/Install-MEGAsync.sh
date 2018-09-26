#!/bin/bash  
#====================================================
#
#          FILE: Install-MEGAsync.sh
# 
#         USAGE: ./Install-MEGAsync.sh 
# 
#   DESCRIPTION: 
# 
#       OPTIONS: ---
#  REQUIREMENTS: ---
#          BUGS: ---
#         NOTES: ---
#        AUTHOR: Brett Salemink (BS), admin@roguedesigns.us
#  ORGANIZATION: Rogue Designs
#       CREATED: 09/15/2018 17:14
#      REVISION:  ---
#====================================================
#set -o nounset                              # Treat unset variables as an error
function WhichOS ()
{
	echo 'Which OS are you using 1. Debian based, 2. Arch based, 3. Gento? [1,2,3]'

	read RESULT
	case $RESULT in
		1)
		InstallMEGAsyncDeb
		;;
		2)
		InstallMEGAsyncArch
		;;
		3)
		InstallMEGAsyncGentoo
		;;
		*)
		echo "Incorrect entry. Not installing MEGAsync."
		;;
	esac
}	# end function

function InstallMEGAsyncDeb ()
{
	echo "Installing For Debian/Based."
	# Install Dependencies
	sudo apt-get install -y build-essential autoconf automake m4 libtool libtool-bin qt4-qmake make libqt4-dev libcrypto++-dev libsqlite3-dev libc-ares-dev libcurl4-openssl-dev libssl-dev libraw-dev libnautilus-extension-dev

	# Make Build Directory
	#export BUILDDIR=$(mktemp -p "${TMPDIR:-.}" -d dir-XXXX) || exit 1
	mkdir "$HOME/buildmegasync"
	export BUILDDIR="$HOME/buildmegasync"
	echo "The build dir is $BUILDDIR."	
	
	# Clone MEGAsync
	cd "$BUILDDIR"
	git clone --recursive https://github.com/meganz/MEGAsync.git
	cd MEGAsync

	# Build MEGAsync
	cd src
	./configure
	qmake MEGA.pro
	lrelease MEGASync/MEGASync.pro
	make
}	# end function


function InstallMEGAsyncArch ()
{
	echo "Installing For Arch."

	# Make Build Directory
	#export BUILDDIR=$(mktemp -p "${TMPDIR:-.}" -d dir-XXXX) || exit 1
	mkdir "$HOME/buildmegasync"
	export BUILDDIR="$HOME/buildmegasync"
	echo "The build dir is $BUILDDIR."	
	
	# Clone MEGAsync
	cd "$BUILDDIR"
	git clone --recursive https://github.com/meganz/MEGAsync.git
	cd MEGAsync

	# Build MEGAsync
	cd src
	./configure
	qmake MEGA.pro
	lrelease MEGASync/MEGASync.pro
	make
}	# end function

function InstallMEGAsyncGentoo ()
{
	echo "Installing For Gentoo."    
	sudo emerge MEGAsync --autounmask-write
       	sudo etc-update
	sudo emerge MEGAsync	
}	# end function

function ConfigureMEGAsyncUser ()
{
	MEGAsync config --global user.name "stiles69"
	MEGAsync config --global user.email "brett.salemink@gmail.com"
	MEGAsync config --global core.editor "vim"
}	# end function

function CleanUp ()
{
	cd $HOME	
}

function Main ()
{
	WhichOS
	CleanUp	
}	# end Main

Main

# == exit ==
exit 0
