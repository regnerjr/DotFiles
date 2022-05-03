echo "Loaded zshenv"
#Add Standard Paths
export PATH="/opt/homebrew/bin:/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# Add user bin file to path
export PATH="$HOME/bin:$PATH"

# ADD RBENV to path
export PATH="/usr/local/var/rbenv/shims:$HOME/.rbenv/shims:$PATH"

# Add rust bin to path
if [[ -d "$HOME/.cargo/bin" ]]; then
  export PATH=$PATH:~/.cargo/bin
fi

if [[ -d "$HOME/.cargo/env" ]] ; then
  source "$HOME/.cargo/env"
fi

# Make sure fzf is visible
export PATH="${PATH}:${VIMCONFIG}/pack/bundle/start/fzf/bin"

source ~/.env
