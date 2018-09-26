#!/bin/bash
#====================================================
#
#          FILE:  3-Install-Packages# 
#         USAGE:  
# 
#   DESCRIPTION:  
# 
#       OPTIONS:  None
#  REQUIREMENTS:  None
#          BUGS:  None
#         NOTES:  
#        AUTHOR:  Brett Salemink (BS), brett.salemink@gmail.com
#       COMPANY:  Rogue Designs
#       VERSION:  1.0
#       CREATED:  12/04/2017 04:02:50 PM CST
#      REVISION:  
#====================================================`
sudo apt-get install zsh
# Set zsh for user
sudo chsh -s /bin/zsh brettsalemink

#Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

cp $HOME/bin/files/home/brettsalemink/.zshrc $HOME/.zshrc
echo "Finished copying .zshrc to home directory. Check ~/.zshrc to ensure PATH is set. Line should read export PATH=$HOME/bin:$PATH and export PATH=$HOME/lib/sh:$PATH"


exit 0
