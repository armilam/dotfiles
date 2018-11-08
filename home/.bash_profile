
# Git shortcuts
alias st='git status'
alias co='git checkout'
alias pull='git pull'
alias push='git push'
alias start-over="git checkout master && git fetch origin && git pull && bundle && npm run webpack && rake db:migrate"

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
alias lly-start-infrastructure='startpg && startredis && startes'
alias lly-stop-infrastructure='stopes && stopredis && stoppg'

alias lly-core-server="ALGOLIA_INDEX_NAME_CUSTOMIZER=armilam PUBLIC_HOST=lvh.me:3000 SCOUT_DEV_TRACE=true rails s -b 127.0.0.1 -p 3000"
alias lly-core-console="ALGOLIA_INDEX_NAME_CUSTOMIZER=armilam PUBLIC_HOST=lvh.me:3000 bundle exec rails c"
alias lly-core-sidekiq="ALGOLIA_INDEX_NAME_CUSTOMIZER=armilam PUBLIC_HOST=lvh.me bundle exec sidekiq -q paperclip -q default -q mailers -q searchkick -q long_running"

export PATH="$PATH:$HOME/dotfiles/bin:/usr/local/opt/libpq/bin"

