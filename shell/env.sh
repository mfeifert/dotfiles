# System-specific configuration

case $(uname -s) in
  "Darwin")
    alias ls='ls -Ah --color=always'
    ;;
  "Linux")
    alias ls='ls -Ah --color=auto --group-directories-first'
    alias ip='ip -c'
    alias ports='sudo ss -tulpnQH | sort -k 5'
    ;;
  *)
    echo "Unknown system type"
    ;;
esac

# Environment variables

export PATH=$HOME/scripts:$PATH
export EDITOR=nvim
export DB=~/Sync/db
export LEDGER_FILE=~/Sync/finance/2024.ledger
export LESSHISTFILE=-
export HISTSIZE=
export FZF_DEFAULT_COMMAND='rg --hidden --files'
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}' --border=rounded --layout=reverse"

# Aliases

alias c='clear'
alias ll='eza -algh --icons=always --group-directories-first'
alias p='python3 -q'
alias lg='lazygit'
alias watch='watch --color'
alias po='ping 1.1.1.1'
alias db='cd $DB'
alias dot='cd ~/dotfiles && nvim -c "FzfLua files"'
alias www='cd ~/www && nvim -c "FzfLua files"'
alias t='tmux attach'
alias tk='tmux kill-session'
alias tl='tmux ls'

## Scripts

alias s='shows'
alias y='yoga'
alias we='water.py $DB/health.db entry'
alias wr='water.py $DB/health.db report'
alias n='nutrition.py $DB/test.db'
alias ipq='~/projects/ip-quiz/ip-quiz.py'

## ledger & hledger

alias ledger='ledger -f $LEDGER_FILE'
alias hledger='hledger --pretty --strict'
alias hla='hledger -f ~/Sync/finance/2020.ledger -f ~/Sync/finance/2021.ledger \
                   -f ~/Sync/finance/2022.ledger -f ~/Sync/finance/2023.ledger \
                   -f ~/Sync/finance/2024.ledger'       # hledger all
alias reg='hledger reg -p thismonth'                    # register
alias hlp='hledger print -p thismonth'                  # print
alias bs='clear && hledger bs --drop 1'                 # balance sheet
alias bsm='bs -M'                                       # balance sheet monthly
alias is='clear && hledger is --drop 1 -S -b thismonth' # income statement
alias ism='clear && hledger is --drop 1 -MST'           # income statement monthly
alias iss='is -2'                                       # income statement short
alias issm='ism -2'                                     # income statement short monthly
alias isa='hla is --drop 1'                             # income statement all
alias issa='isa -2'                                     # income statement short all
