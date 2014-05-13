#!/bin/sh


################################################################################
#                                                                              #
# Script to set up development environment                                     #
#                                                                              #
# Author: AbstractOwl <https://github.com/abstractOwl/minix-provisioning>        #
#                                                                              #
################################################################################


## Constants ###################################################################
CONFIG=./config


## Start Script ################################################################

## Update Package List
echo "Updating package list..."
pkgin up
echo

## Install Packages
while read package; do
    echo "Installing $package..."
    pkgin -y in $package
    echo
done < "$CONFIG/packages.txt"

## Copy .aliases File (See README for shortcut documentation)
{
    echo "Installing aliases..."

    cp config/.aliases ~/
    cp -r config/.aliases.d/ ~/

    # Source aliases
    echo ". ~/.aliases" >> ~/.profile

    echo
}

## Make a dev directory
if !(test -d ~/dev/); then
    echo "Creating ~/dev/ directory..."
    mkdir ~/dev/

    echo "\$DEV now points to ~/dev/"
    echo "export DEV=$HOME/dev" >> ~/.profile

    echo
fi

## Back Up /usr/src
if !(test -d /usr/minix_src_clean); then
    echo "Backing up /usr/src to /usr/minix_src_clean/..."
    cp -r /usr/src/ /usr/minix_src_clean
    echo
fi

cd ~
. ~/.profile
cd -

echo "Finished. You may need to restart for all changes to take effect."

