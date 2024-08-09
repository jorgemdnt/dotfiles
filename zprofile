export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin
# Set PATH, MANPATH, etc., for Homebrew.
if [ -f '/opt/homebrew/bin/brew' ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
source "$HOME/.cargo/env"

export PATH=${PATH}:`go env GOPATH`/bin
