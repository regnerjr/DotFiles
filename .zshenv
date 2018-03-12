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
