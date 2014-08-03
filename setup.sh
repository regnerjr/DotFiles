#!/usr/bin/env bash
[ -f $HOME/.bashrc ] && rm $HOME/.bashrc
ln -s $PWD/.bashrc $HOME/.bashrc
[ -f $HOME/.inputrc ] && rm $HOME/.inputrc 
ln -s $PWD/.inputrc $HOME/.inputrc
[ -f $HOME/.bash_logout ] && rm $HOME/.bash_logout 
ln -s $PWD/.bash_logout $HOME/.bash_logout
[ -f $HOME/.profile ] && rm $HOME/.profile
ln -s $PWD/.profile $HOME/.profile


#Install liquidprompt and set it up
if [[ ! -d $HOME/liquidprompt ]] ; then
    printf "Cloning liquidprompt from github\n"
    git clone https://github.com/nojhan/liquidprompt.git $HOME/liquidprompt
fi
printf "Symlinking .liquidpromptrc\n"
[ -f $HOME/.liquidpromptrc ] && rm $HOME/.liquidpromptrc
ln -s $PWD/.liquidpromptrc $HOME/.liquidpromptrc

# check if zsh is installed
which zsh &>/dev/null  && ZSH_INSTALLED=1
if [ $ZSH_INSTALLED ] ; then 
    if [[ ! -d $HOME/.oh-my-zsh ]] ; then
        printf "Cloning oh-my-zsh from github\n"
        git clone https://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
    fi
    printf "Horray ZSH. Linking .zshrc\n"
    [ -f $HOME/.zshrc ] && rm $HOME/.zshrc 
    ln -s $PWD/.zshrc       $HOME/.zshrc
fi

#Install emacs prelude 
if [[ ! -d $HOME/prelude ]] ; then 
    printf "Cloning emacs prelude from github\n"
    git clone https://github.com/bbatsov/prelude.git $HOME/prelude
    ln -s $HOME/prelude $HOME/.emacs.d
fi
# symlink the emacs personal files
[ -d $HOME/prelude/personal/emacs ] && rm -rf $HOME/prelude/personal/emacs
[ -f $HOME/prelude/prelude-modules.el ] && rm $HOME/prelude/prelude-modules.el
ln -s $PWD/prelude-modules.el $HOME/prelude/prelude-modules.el

for file in $PWD/emacs/* ; do
    ln -s $PWD/emacs/$(basename $file) $HOME/prelude/personal/$(basename $file) ;
done

# symlink the tmux config
[ -f $HOME/.tmux.conf ]  && rm $HOME/.tmux.conf
ln -s $PWD/.tmux.conf $HOME/.tmux.conf
# symlink .vimrc
[ -f $HOME/.vimrc ] && rm $HOME/.vimrc
ln -s $PWD/.vimrc $HOME/.vimrc
# clone vundle to ./vim 
git clone https://github.com/gmarik/Vundle.vim.git $PWD/.vim/bundle/Vundle.vim
ln -s $PWD/.vim $HOME/.vim
