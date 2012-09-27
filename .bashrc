# Add '~/bin' to the '$PATH'
export PATH="$HOME/bin:$PATH"

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

# Resize history
export HISTSIZE=10000
# Ignore Duplicates
export HISTCONTROL=ignoreboth
# Append to the Bash history file, rather than overwriting it
shopt -s histappend

# Autocorrect typos in path names when using `cd`
shopt -s cdspell

# Add tab completion for `defaults read|write NSGlobalDomain`
# You could just use `-g` instead, but I like being explicit
complete -W "NSGlobalDomain" defaults

# If possible, add tab completion for many more commands
[ -f /etc/bash_completion ] && source /etc/bash_completion
