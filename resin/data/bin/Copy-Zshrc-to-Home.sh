#!/bin/bash

echo "This will copy .zshrc to home directory. Do you want to proceed? (Y/n)"
read VARPROCEED

case $VARPROCEED in
     Y)
          cp .zshrc ~/
          ;;
     *)
          exit 0
          ;;
esac        




