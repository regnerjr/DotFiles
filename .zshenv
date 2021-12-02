#Add Standard Paths
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# Add user bin file to path
export PATH="$HOME/bin:$PATH"
# add Swift Toolchains to path
export PATH="/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin:${PATH}"
# ADD RBENV to path
export PATH="/usr/local/var/rbenv/shims:$HOME/.rbenv/shims:$PATH"

# ADD gpg-agent
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
# ADD gettext (gnupg dependency)
export PATH="/usr/local/opt/gettext/bin:$PATH"

# ADD gpg-agent
export PATH="/usr/local/opt/gpg-agent/bin:$PATH"
# ADD gettext (gnupg dependency)
export PATH="/usr/local/opt/gettext/bin:$PATH"

# Add rust bin to path
export PATH=$PATH:~/.cargo/bin

# Add sourckit lsp debug mode
export PATH="${PATH}:/Users/j0r010l/dev/sourcekit-lsp/.build/debug"

# From Modern Vim by Drew Niel
export VIMCONFIG=~/.vim
export VIMDATA=~/.vim

# Make sure fzf is visible
export PATH="${PATH}:${VIMCONFIG}/pack/bundle/start/fzf/bin"

source ~/.env

