
# Git shortcuts
alias st="git status"
alias pull="git pull"
alias push="git push"

# Rails development
alias be="bundle exec"

# Tools
alias startpg="pg_ctl start"
alias stoppg="pg_ctl stop"
alias startredis="redis-server"

# asdf
. $HOME/.asdf/asdf.sh
. $HOME/.asdf/completions/asdf.bash

# TODO: I need to do something with the path
# add libpq to the end of the path (done)
# other things?
export PATH="$PATH:$HOME/dotfiles/bin:/usr/local/opt/libpq/bin"

