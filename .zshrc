# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="avit"

# Use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Enable command auto-correction.
# ENABLE_CORRECTION="true"

# Display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(alcatraz brew common-aliases compleat colored-man-pages colorize git git-extras git-prompt xcode)

# User configuration

#Add Standard Paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# Add user bin file to path
export PATH="$HOME/bin:$PATH"
# add Swift Toolchains to path
export PATH="/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:${PATH}"
# ADD RBENV to path
export PATH="/usr/local/var/rbenv/shims:$HOME/.rbenv/shims:$PATH"

source $ZSH/oh-my-zsh.sh

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias v="vim"
alias mkx="cd swift;utils/build-script -X --skip-build -- --reconfigure"
alias sx="cd swift; cd ../build/Xcode-DebugAssert/swift-macosx-x86_64/; xc ; cd swift;"
cdpath=(.. ../.. /Users/john/dev/GitHub /Users/john/dev/GitHub/AppleSwift)

source ~/.env

# Configure GPG agent
if hash gpg-agent 2>/dev/null; then
    [ -f ~/.gpg-agent-info ] && source ~/.gpg-agent-info
    if [ -S "${GPG_AGENT_INFO%%:*}" ]; then
        export GPG_AGENT_INFO
    else
        eval $( gpg-agent --daemon --write-env-file ~/.gpg-agent-info )
    fi
    export GPG_TTY=`tty`

fi
