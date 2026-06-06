
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


complete -C /opt/homebrew/bin/terraform terraform

# Added by LM Studio CLI (lms)
export PATH="$PATH:/Users/armilam/.lmstudio/bin"
# End of LM Studio CLI section


# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/homebrew/Caskroom/miniforge/base/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh" ]; then
        . "/opt/homebrew/Caskroom/miniforge/base/etc/profile.d/conda.sh"
    else
        export PATH="/opt/homebrew/Caskroom/miniforge/base/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

