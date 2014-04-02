#If not running interactively, don't do anything
[[ $- == *i* ]] || return

# Add '~/bin' to the '$PATH'
if [ -d "${HOME}/bin" ] ; then
    export PATH="$HOME/bin:$PATH"
fi

#include ~/.inputrc
export INPUTRC=~/.inputrc

# Load the shell dotfiles, and then some:
# * ~/DotFiles/.path can be used to extend `$PATH`.
# * ~/DotFiles/.extra can be used for other settings you don’t want to commit.
for file in ~/DotFiles/.{path,bash_prompt,exports,aliases,functions,extra}; do
    [ -r "$file" ] && source "$file"
done
unset file

# Case-insensitive globbing (used in pathname expansion)
shopt -s nocaseglob
# When changing directory small typos can be ignored by bash
# for example, cd /vr/lgo/apaache would find /var/log/apache
shopt -s cdspell
#
# other bash shortcuts
shopt -s autocd
shopt -s dirspell
shopt -s dotglob
shopt -s hostcomplete
shopt -s checkwinsize

# Resize history
export HISTSIZE=10000
# Ignore Duplicates
export HISTCONTROL=ignoreboth
export PROMPT_COMMAND="history -a"
# Append to the Bash history file, rather than overwriting it
shopt -s histappend
shopt -s cmdhist
shopt -s histreedit
shopt -s histverify

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion

# Less Colors for Man Pages
export LESS_TERMCAP_mb=$'\E[01;31m'       # begin blinking
export LESS_TERMCAP_md=$'\E[01;38;5;74m'  # begin bold
export LESS_TERMCAP_me=$'\E[0m'           # end mode
export LESS_TERMCAP_se=$'\E[0m'           # end standout-mode
export LESS_TERMCAP_so=$'\E[38;5;246m'    # begin standout-mode - info box
export LESS_TERMCAP_ue=$'\E[0m'           # end underline
export LESS_TERMCAP_us=$'\E[04;38;5;146m' # begin underline

export SVN_EDITOR=emacs
export VISUAL=less
export EDITOR=emacs

echo -----=====BASHRC LOADED=====-----
