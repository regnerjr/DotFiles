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

zstyle ':completion:*' completer _extensions _complete _approximate
zstyle ':completion:*' matcher-list 'm:{[:lower:]}={[:upper:]}' 'm:{[:lower:][:upper:]}={[:upper:][:lower:]}' 'r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 3
zstyle ':completion:*' prompt '%e'
zstyle ':completion:*' substitute 1
zstyle ':completion:*' verbose true
zstyle ':completion:*' menu select
zstyle ':completion:*:*:*:*:descriptions' format '%F{green}-- %d --%f'
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'

zstyle :compinstall filename '/Users/j0r010l/.zshrc'

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

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

# use nVim as the visual editor
export VISUAL=nvim
export EDITOR=$VISUAL

# From Modern Vim by Drew Niel
export VIMCONFIG=~/.config/nvim
export VIMDATA=~/.local/share/nvim

export LANG=en_US.UTF-8

autoload -U edit-command-line
zle -N edit-command-line
bindkey '^x^e' edit-command-line

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
autoload -Uz new-worktree
autoload -Uz tab

if [[ -r ~/.aliasrc ]]; then 
    . ~/.aliasrc
fi

cdpath=(.. ../.. dev)

export GPG_TTY

# Setup NVM
export NVM_DIR="${HOME}/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#setup rbenv
eval "$(rbenv init - zsh)"

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

# Load brew completions
if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh-completions:$FPATH
fi

function tab {
  # Must not have trailing semicolon, for iTerm compatibility
  local command="cd \\\"$PWD\\\"; clear"
  (( $# > 0 )) && command="${command}; $*"

  # Discarding stdout to quash "tab N of window id XXX" output
  osascript >/dev/null <<EOF
    tell application "System Events"
      tell process "Terminal" to keystroke "t" using command down
    end tell
    tell application "Terminal" to do script "${command}" in front window
EOF
}

function new-worktree {
    local project_root="$HOME/Developer/glass-app"
    local worktree_path="$HOME/Developer/glass-app-worktrees"

    pushd $project_root
    # get latest development to put our worktree on
    git fetch origin development:development
    git worktree add -b john/$1 $worktree_path/$1 origin/development

    popd

    # Get the worktree ready to use.
    pushd $worktree_path/$1
    tab "glass environment setup; ./scripts/resolve-swift-packages.sh; xc"
    popd
}

alias vpnc='node /Users/j0r010l/Developer/walmart-vpn-cli-1.1/index.js'
alias vpnx='node /Users/j0r010l/Developer/walmart-vpn-cli-1.1/disconnect.js'

export PATH=$HOME/.mint/bin:$PATH
# setup pyenv
if command -v pyenv 1>/dev/null 2>&1; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init --path)"
  eval "$(pyenv init -)"
fi

# GPG
export GPG_TTY=$(tty)
