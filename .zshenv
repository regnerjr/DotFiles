echo "Loaded zshenv"
#Add Standard Paths
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/bin:/usr/sbin:/sbin"

# Add user bin file to path
export PATH="$HOME/bin:$PATH"
# add Swift Toolchains to path
export PATH="${PATH}:/Library/Developer/Toolchains/swift-latest.xctoolchain/usr/bin"
export SOURCEKIT_TOOLCHAIN_PATH="/Library/Developer/Toolchains/swift-latest.xctoolchain"

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
. "$HOME/.cargo/env"
