#!/usr/bin/env bash

export TERM="screen-256color"
export NVIM_TUI_ENABLE_TRUE_COLOR=1
source "/usr/local/bin/virtualenvwrapper_lazy.sh"
export WORKON_HOME=$HOME/.virtualenvs

source "$HOME/gruvboxcolors.sh"

# Path to the bash it configuration
export BASH_IT="/home/jorge/.bash_it"

# Lock and Load a custom theme file
# location /.bash_it/themes/
export BASH_IT_THEME='tylenol'

# Your place for hosting Git repos. I use this for private repos.
export GIT_HOSTING='git@git.domain.com'

# Don't check mail when opening terminal.
unset MAILCHECK

# Change this to your console based IRC client of choice.
export IRC_CLIENT='irssi'

# Set this to the command you use for todo.txt-cli
export TODO="t"

# Set this to false to turn off version control status checking within the prompt for all themes
export SCM_CHECK=true

alias vim="nvim"

# Set vcprompt executable path for scm advance info in prompt (demula theme)
# https://github.com/xvzf/vcprompt
#export VCPROMPT_EXECUTABLE=~/.vcprompt/bin/vcprompt

# Load Bash It
source $BASH_IT/bash_it.sh

## Base16 Shell
#BASE16_SHELL="$HOME/.config/base16-shell/base16-brewer.dark.sh"
#[[ -s $BASE16_SHELL ]] && source $BASE16_SHELL
#clear

. /usr/share/autojump/autojump.sh
