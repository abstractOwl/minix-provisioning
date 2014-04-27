#!/bin/sh


################################################################################
#                                                                              #
# Script to set up development environment                                     #
#                                                                              #
# Author: AbstractOwl <https://github.com/abstractOwl/minix-provisioning>        #
#                                                                              #
################################################################################


## Includes ####################################################################
. utility.sh

## Constants ###################################################################
CONFIG=./config


## Start Script ################################################################

## Update Package List
echo "Updating package list..."
result=$(pkgin up)
echo $result | indent 2
echo

## Install Packages
while read package; do
    echo "Installing $package..."

    result=$(pkgin in -y package)
    echo $result | indent 2

    echo
done < "$CONFIG/packages.txt"

## Copy .aliases File (See README for shortcut documentation)
if !(test -f ~/.aliases); then
    echo "Installing aliases..."

    cp config/.aliases ~/
    cp -r config/.aliases.d/ ~/

    cd ~
    . ~/.aliases
    echo ". .aliases" >> ~/.profile
    cd -

    echo
fi

## Make a dev directory
if !(test -d ~/dev/); then
    echo "Creating ~/dev/ directory..."
    mkdir ~/dev/
    echo "\$DEV now points to ~/dev/"
    export DEV=~/dev/
    echo
fi

## Back Up /usr/src
if !(test -d /usr/minix_src_clean); then
    echo "Backing up /usr/src to /usr/minix_src_clean/..."
    cp -r /usr/src/ /usr/minix_src_clean
    echo
fi

echo "Finished. You may need to restart for all changes to take effect."

