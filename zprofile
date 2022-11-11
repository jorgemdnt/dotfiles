export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin
# Set PATH, MANPATH, etc., for Homebrew.
eval "$(/opt/homebrew/bin/brew shellenv)"

# Add RVM to PATH for scripting. Make sure this is the last PATH variable change.
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
