
# Git shortcuts
alias st='git status'
alias co='git checkout'
alias pull='git pull'
alias push='git push'

# Rails development
alias be='bundle exec'

# Tools
alias startpg='pg_ctl start -w'
alias stoppg='pg_ctl stop'
alias startredis='redis-server --daemonize yes'
alias stopredis='redis-cli shutdown'
alias startes='elasticsearch -p /tmp/elasticsearch-pid -d'
alias stopes='kill $(cat /tmp/elasticsearch-pid)'

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Lessonly
alias startlly='startpg && startredis && startes'
alias stoplly='stopes && stopredis && stoppg'

export PATH="$PATH:$HOME/dotfiles/bin:/usr/local/opt/libpq/bin"

