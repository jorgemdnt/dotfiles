export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin
# Set PATH, MANPATH, etc., for Homebrew.
if [ -f '/opt/homebrew/bin/brew' ]; then
	eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Add rbenv to PATH for scripting
if [ -d "$HOME/.rbenv/bin" ]; then
    export PATH="$HOME/.rbenv/bin:$PATH"
fi
if command -v rbenv &> /dev/null; then
    eval "$(rbenv init -)"
fi
#source "$HOME/.cargo/env"

if command -v go &> /dev/null; then
    export PATH="${PATH}:$(go env GOPATH)/bin"
fi

# Created by `pipx` on 2024-08-11 00:56:47
export PATH="$PATH:/Users/jorgemodesto/.local/bin"
