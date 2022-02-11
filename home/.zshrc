export ZSH=/Users/armilam/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git asdf)

# This enables completion for heroku and must appear before calling oh-my-zsh.sh
if type brew &>/dev/null
then
  FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

  autoload -Uz compinit
  compinit
fi

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Shell
alias vz='vi ~/.zshrc'

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash
alias arst='asdf'

# git
alias st='git status'
alias co='git checkout'
alias fco='git fco'
alias pull='git pull'
alias push='git push'
alias start-over="git checkout master && git fetch origin && git pull && bundle && npm run webpack && rake db:migrate"
alias rb='git rebase'

function gitscript() {
  echo "Doing $1"
  ./.git/scripts/$1
}
alias gs='gitscript'

# ssh
function sshall() {
  eval $(ssh-agent -s)
  ssh-add --apple-load-keychain
}
alias ssha='sshall'

# Heroku
alias dburl='heroku config:get DATABASE_URL -a '
alias h='heroku'

# Rails development
alias be='bundle exec'
alias devlog='tail -f log/development.log ~/Library/Logs/puma-dev.log'
alias pumar='touch tmp/restart.txt'
alias pumas='puma-dev -stop'
alias pumak='killall -9 puma-dev'

# Docker
alias dc='docker-compose'
alias dcu='docker-compose up'
alias dcd='docker-compose down'
alias dcr='docker-compose run'

# Tools
alias startpg='pg_ctl start -w'
alias stoppg='pg_ctl stop'
alias startredis='redis-server --daemonize yes'
alias stopredis='redis-cli shutdown'

alias ff='fzf'

export PATH="$PATH:$HOME/dotfiles/bin:/usr/local/opt/libpq/bin"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/armilam/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/armilam/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/armilam/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/armilam/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# Woven dev
alias wo='. work'
alias cdw='cd ~/Documents/Woven/Source/apply-yourself'

