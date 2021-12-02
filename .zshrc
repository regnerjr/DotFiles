echo "loaded zshrc"
# show possible completions (not just a beep)
setopt autolist

# If LOCAL_OPTIONS is set in a function (or was already set before the
# function, and not unset inside it), then any options which are changed inside
# the function will be put back the way they were when the function finishes
setopt local_options

# Configure history
HISTSIZE=2000
SAVEHIST=2000
HISTFILE=~/.zsh_history

setopt inc_append_history
setopt share_history
setopt extended_history
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt hist_find_no_dups
setopt hist_reduce_blanks
setopt hist_ignore_space
setopt hist_no_store
setopt hist_no_functions

# Other nice things
setopt no_beep
setopt auto_cd
setopt correct
setopt no_case_glob

# path array should be kept unique
typeset -U path

# Setup the completion system
# The following lines were added by compinstall

zstyle ':completion:*' completer _expand _complete _ignored _match _correct _approximate _prefix
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle ':completion:*' menu select

zstyle :compinstall filename '/Users/j0r010l/.zshrc'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Bring in brew autocompletes
if type brew &>/dev/null; then
    FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

autoload -Uz compinit
compinit

# show first match right away
setopt menu_complete

# load the colors function?
autoload -Uz colors && colors

# Color LS output
export CLICOLOR=1

# Initialize the prompt system promptinit
autoload -Uz promptinit

# use Vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

export LANG=en_US.UTF-8

# Git integration that I do not understand
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '[%b|%a] %c%u '
zstyle ':vcs_info:*' formats '[%b] %c%u '
precmd () { vcs_info }

setopt prompt_subst

# PROMPT
# show current path, and % prompt or # if root.
PS1='%~ ${vcs_info_msg_0_} %# '

# Show green next, or red question mark and error code number
RPS1='%(?.%F{green}↩︎.%F{red}?%?)%f'

fpath=(~/.zsh-functions /usr/local/share/zsh-completions $fpath)
autoload -Uz delete_branches

if [[ -r ~/.aliasrc ]]; then 
    . ~/.aliasrc
fi

cdpath=(.. ../.. dev)

# Setup GPG
GPG_TTY=$(tty)
export GPG_TTY

# Setup NVM
export NVM_DIR="${HOME}/.nvm"
# This loads nvm
brew_nvm=$(brew --prefix nvm)
[ -s "$brew_nvm/nvm.sh" ] && source "$brew_nvm/nvm.sh"


compdef g='git'
function g {
    if [[ $# > 0 ]]; then
        git $@
    else
        git status --short --branch
    fi
}

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='ag -g ""'

# ADD Xcode tools to end of path
export PATH="$PATH:$(xcode-select -p)/Toolchains/XcodeDefault.xctoolchain/usr/bin"

# Add gems from ruby 3.0.0 to path
export PATH="$PATH:/usr/local/lib/ruby/gems/3.0.0/bin"

# Add Swift mint tools
export PATH="$HOME/.mint/bin:$PATH"

# brew installed ruby is the main one
export PATH="/usr/local/opt/ruby/bin:$PATH"

# Load brew completions
if type brew &>/dev/null; then
	FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

# Load rbenv automatically by appending
eval "$(rbenv init - zsh)"

# Load pyenv automaticaly
eval "$(pyenv init -)"

alias vpnc='node /Users/j0r010l/dev/walmart-vpn-cli/index.js && exit'
alias vpnx='node /Users/j0r010l/dev/walmart-vpn-cli/disconnect.js && exit'

function new-worktree {
    local project_root="$HOME/dev/glass-app"
    local worktree_path="$HOME/dev/glass-app-worktrees"

    pushd $project_root
    # get latest development to put our worktree on
    git fetch origin development:development
    git worktree add -b john/$1 $worktree_path/$1 origin/development

    popd
}

