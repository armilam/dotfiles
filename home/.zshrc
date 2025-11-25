export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
 ZSH_THEME="robbyrussell"
#ZSH_THEME="armilam"

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

source $ZSH/oh-my-zsh.sh

autoload -Uz compinit
compinit

# homebrew
eval "$(/opt/homebrew/bin/brew shellenv)"

# User configuration

# Device-specific configuration
if [ -f "$HOME/.zshrc.local" ]; then
  source $HOME/.zshrc.local
else
  echo "No .zshrc.local found."
fi

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

# git
# these all work, but i want to use git aliases instead of adding to the global alias pool
#alias g='git'
#alias st='git status'
#alias co='git checkout'
#alias fco='git fco'
#alias pull='git pull'
#alias push='git push'
#alias start-over="git checkout master && git fetch origin && git pull && bundle && npm run webpack && rake db:migrate"
#alias rb='git rebase'

function gitscript() {
  echo "Doing $1"
  ./.git/scripts/$1 $2 $3
}
alias gs='gitscript'

# Docker
alias dc='docker compose'
alias dcu='docker compose up'
alias dcd='docker compose down'
alias dcr='docker compose restart'
alias dce='docker compose exec'
alias dw='docker compose exec web'

# Denim
alias denim-queues='awslocal sqs create-queue --queue-name denim-local-email-queue && awslocal sqs create-queue --queue-name denim-local-email-event-queue && awslocal sqs create-queue --queue-name denim-local-sms-queue && awslocal sqs create-queue --queue-name denim-local-file-parse-queue && awslocal sqs create-queue --queue-name denim-local-announcement-queue && awslocal sqs create-queue --queue-name denim-local-assignment-queue && awslocal sqs create-queue --queue-name denim-local-create-tango-queue && awslocal sqs create-queue --queue-name denim-local-announcement-notification-queue'
alias denim-buckets='awslocal s3api create-bucket --bucket denim-local-app-bucket && awslocal s3api create-bucket --bucket denim-local-sftp && awslocal s3api create-bucket --bucket denim-local-email-bucket'
alias denim-infra='colima start && startpg & startredis & localstack start > ~/.tmp/.lcltemp & sleep 10 && denim-queues && denim-buckets && tail -f ~/.tmp/.lcltemp'
alias denim-infra-stop='stoppg & stopredis & localstack stop && rm ~/.tmp/.lcltemp'
alias denim-workers='pm worker --queues denim-local-email-queue,denim-local-email-event-queue,denim-local-sms-queue,denim-local-file-parse-queue,denim-local-announcement-queue,denim-local-assignment-queue,denim-local-create-tango-queue,denim-local-announcement-notification-queue'
alias denim-server='pm runserver'
alias denim-client='pnpm start'
alias ssh-dev='ssh 54.88.126.136'
alias ssh-prod='ssh 52.203.157.36'

# Tools
alias startpg='pg_ctl start -w'
alias stoppg='pg_ctl stop'
alias startredis='redis-server --daemonize yes'
alias stopredis='redis-cli shutdown'
alias startmongo='brew services start mongodb-community'
alias stopmongo='brew services stop mongodb-community'

alias ff='fzf'

export PATH="$PATH:/usr/local/opt/libpq/bin"

# Google Cloud SDK
# Update PATH for the Google Cloud SDK.
if [ -f '/Users/armilam/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/armilam/google-cloud-sdk/path.zsh.inc'; fi
# Enable shell command completion for gcloud.
if [ -f '/Users/armilam/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/armilam/google-cloud-sdk/completion.zsh.inc'; fi

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Android
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin
export PATH=$PATH:$ANDROID_HOME/platform-tools

# asdf
# . $HOME/.asdf/asdf.sh
# . $HOME/.asdf/completions/asdf.bash
ASDF_DATA_DIR="$HOME/.asdf"
export PATH="$ASDF_DATA_DIR/shims:$PATH"
alias arst='asdf'

# python
alias py=python
alias pm='python src/manage.py'
alias po='poetry run'
alias activate='python -m venv venv && source venv/bin/activate'
#export PATH="$PATH:`python3 -m site --user-base`/bin"

# node
alias pn=pnpm

# Terraform
alias tf='terraform'
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# bun completions
[ -s "/Users/armilam/.bun/_bun" ] && source "/Users/armilam/.bun/_bun"

# 1Password CLI
eval "$(op completion zsh)"; compdef _op op

# Nix
if [ -e '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh' ]; then
  . '/nix/var/nix/profiles/default/etc/profile.d/nix-daemon.sh'
fi
# End Nix

# pnpm
export PNPM_HOME="$HOME/Library/pnpm"
case ":$PATH:" in
  *":$PNPM_HOME:"*) ;;
  *) export PATH="$PNPM_HOME:$PATH" ;;
esac
# pnpm end

# Parker
export PATH=$PATH:$(arst where golang)/bin
source <(kubectl completion zsh)
alias dn=dotnet
alias kc=kubectl
alias wat='watch '
alias rco='repo checkout'
alias rpull='repo pull'
alias rpush='repo push'
alias rst='repo status'

