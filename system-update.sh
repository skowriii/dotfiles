#!/bin/bash

is_success () {
    if [ $? -eq 0 ]; then
        return 0
    else
        echo LAST COMMAND FINISHED WITH AN ERROR. EXITING...
        exit 1
    fi
}

echo Updating system using yay \(WARNING: update will be run with \"--noconfirm\" option\)
echo

yay -Syu --noconfirm

is_success

echo
echo Clearing yay cache
echo

yay -Scc

is_success

echo
echo Updating flatpak
echo

flatpak update

is_success

echo
echo Updating NeoVim plugins \(WARNING: run Lazy and press Shift+S to update plugins in Lazy\)
echo

nvim

is_success

echo
echo Running Bleachbit and Bleachbit as sudo for cleanup
echo

bleachbit

is_success

sudo bleachbit

is_success

echo
echo Finished system update!
