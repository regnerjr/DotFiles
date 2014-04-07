#!/usr/bin/env bash

if [ -f $HOME/.bashrc ] ; then
    printf "Current .bashrc will be removed!"
    printf "Press ENTER to continue. Ctrl-C to quit"
    read ENTER
fi
rm $HOME/.bashrc
ln --symbolic $PWD/.bashrc $HOME/.bashrc
