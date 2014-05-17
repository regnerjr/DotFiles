#!/usr/bin/env bash

if [ -f $HOME/.bashrc ] ; then
    printf "Current .bashrc will be removed!"
    printf "Press ENTER to continue. Ctrl-C to quit"
    read ENTER
fi
rm $HOME/.bashrc
ln -s $PWD/.bashrc $HOME/.bashrc

if [[ -d $HOME/liquidprompt ]] ; then
    printf "Looks like you have liquid prompt installed."
    printf "Symlinking .liquidpromptrc"
    rm $HOME/.liquidpromptrc
    ln -s $PWD/.liquidpromptrc $HOME/.liquidpromptrc
fi

if [[ -f $HOME/.bash_logout ]] ; then
    rm $HOME/.bash_logout
    printf "Symlinking new .bash_logout"
    ln -s $PWD/.bash_logout $HOME/.bash_logout
fi


if [[ $SHELL == '/bin/zsh' ]]; then
    printf "Horray ZSH. Linking .zshrc"
    ln -s $PWD/.zshrc       $HOME/.zshrc
fi
