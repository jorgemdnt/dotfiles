# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="norm"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND="true"
setopt HIST_IGNORE_ALL_DUPS
# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git autojump zsh-syntax-highlighting history-substring-search zsh-completions)
[[ -s /home/jorge.modesto/.autojump/etc/profile.d/autojump.sh ]] && source /home/jorge.modesto/.autojump/etc/profile.d/autojump.sh
autoload -U compinit && compinit -u

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias vim="nvim"
alias open="xdg-open"
alias vimrc="vim ~/.config/nvim/init.vim"
alias gvimrc="vim ~/.vim/gvimrc"
alias gs="g s"
alias zshrc="vim ~/.zshrc"
alias note="vim ~/notes/"
alias todo="vim ~/notes/todo.md"
alias ohmyzsh="vim ~/.oh-my-zsh"
alias r="rd-docker"
alias rr="rd-docker"
alias t="tmux"

# export GOPATH=$HOME/go
# export GOROOT=/usr/lib/go
# export PATH=$GOPATH/bin:$GOROOT/bin:$PATH

# export PATH="/home/jorgemdnt/anaconda2/bin:$PATH"

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

if [ -d "$HOME/platform-tools" ] ; then
    export PATH="$HOME/platform-tools:$PATH"
fi

export GPG_TTY=$(tty)

export CHROME_BIN=$(which chromium)

# Allow Ctrl-z to toggle between suspend and resume
function Resume {
    fg
    zle push-input
    BUFFER=""
    zle accept-line
}
zle -N Resume
bindkey "^Z" Resume

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export PATH="$PATH:$HOME/KindleGen"

# added by travis gem
[ -f /home/jorgemodesto/.travis/travis.sh ] && source /home/jorgemodesto/.travis/travis.sh
export PATH="$HOME/.rbenv/bin:$PATH"

eval "$(rbenv init -)"
export PATH="$PATH:$(ruby -e 'print Gem.user_dir')/bin"

bindkey -v
export KEYTIMEOUT=1

export REDISTOGO_URL=redis://redis:6379


export PRODUCTION='production-230322'
export STAGING='staging-234557'
export STAGING2='staging2-174287'
alias projects='echo -e "production:\t${PRODUCTION}\nstaging:\t${STAGING}\nstaging2:\t${STAGING}"'
