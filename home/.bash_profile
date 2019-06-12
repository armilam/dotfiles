
# Bash
alias bp="source ~/.bash_profile"

# SSH Keys
alias ssh-github="ssh-add ~/.ssh/github"

# git
source ~/.git_completion
alias st='git status'
alias co='git checkout'
alias fco='git fco'
alias pull='git pull'
alias push='git push'
alias start-over="git checkout master && git fetch origin && git pull && bundle && npm run webpack && rake db:migrate"

# Heroku
alias dburl='heroku config:get DATABASE_URL -a '

# Rails development
alias be='bundle exec'

# Tools
alias startpg='pg_ctl start -w'
alias stoppg='pg_ctl stop'
alias startredis='redis-server --daemonize yes'
alias stopredis='redis-cli shutdown'
alias startes='elasticsearch -p /tmp/elasticsearch-pid -d'
alias stopes='kill $(cat /tmp/elasticsearch-pid)'

alias ff='fzf'

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# Lessonly
alias lly-start-infrastructure='startpg && startredis && startes'
alias lly-stop-infrastructure='stopes && stopredis && stoppg'

alias lly-core-server="bundle exec rails s -b 127.0.0.1 -p 3000"
alias lly-core-console="bundle exec rails c"
alias lly-core-sidekiq="bundle exec sidekiq -q paperclip -q default -q mailers -q searchkick -q long_running"

alias lly-rspec="PUBLIC_HOST=lvh.me be rspec"

# Load neat prompt
source ~/.bash_prompt

export PATH="$PATH:$HOME/dotfiles/bin:/usr/local/opt/libpq/bin"

