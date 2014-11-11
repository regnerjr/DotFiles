# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
ZSH_THEME="agnoster"

# Load external files
source ~/DotFiles/.aliases
source ~/DotFiles/.functions
source ~/DotFiles/.python
source ~/DotFiles/.path

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git colored-man colorize debian gem history ruby svn svn-fast-info tmux )

source $ZSH/oh-my-zsh.sh

# User configuration

# You may need to manually set your language environment
export LANG=en_US.UTF-8

export EDITOR='vim'

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
export SSH_KEY_PATH="~/.ssh/id_rsa"

if [[ $OS == Windows_NT ]] ; then
   #Set DEFAULT_USER so that agnoser theme will not print my user@machine
   DEFAULT_USER="regner.j"
   source ~/proxy_config;
else
   DEFAULT_USER="john"
fi
