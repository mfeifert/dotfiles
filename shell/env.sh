# System-specific configuration

case $(uname -s) in
    "Darwin")
        alias ls='ls -Ah --color=always'
        ;;
    "Linux")
        alias ls='ls -Ah --color=auto --group-directories-first'
        alias ip='ip -c'
        ;;
    *)
        echo "Unknown system type"
        ;;
esac

# Environment variables

export EDITOR=hx
export PATH=$HOME/scripts:$HOME/projects/db_scripts:$PATH
export DB=~/Sync/db
export LEDGER_FILE=~/Sync/finance/2024.ledger
export LESSHISTFILE=-
export FZF_DEFAULT_COMMAND='rg --hidden --files'
export FZF_DEFAULT_OPTS="--preview 'bat --color=always {}' --border=rounded --layout=reverse"

# Aliases

alias c='clear'
alias ll='eza -algh --icons=always --group-directories-first'
alias p='python3 -q'
alias watch='watch --color'
alias p1='ping 1.1.1.1'
alias db='cd $DB'
alias dot='cd ~/dotfiles && $EDITOR'
alias www='cd ~/www && $EDITOR'
alias ipq='~/projects/ip_quiz/ip_quiz.py'

## Database scripts

alias s='shows.py $DB/media.db'
alias y='yoga.py $DB/health.db'
alias we='water.py $DB/health.db entry'
alias wr='water.py $DB/health.db report'
alias n='nutrition.py $DB/test.db'
alias fuel='fuel.py $DB/auto.db'

## ledger & hledger

alias ledger='ledger -f $LEDGER_FILE'
alias hledger='hledger --pretty -s'
alias ha='hledger add'
alias reg='hledger reg -p thismonth'
alias bs='clear && hledger bs --drop 1'
alias bsm='bs -M'
alias is='clear && hledger is --drop 1 -S -b thismonth'
alias ism='clear && hledger is --drop 1 -MST'
alias iss='is -2'
alias issm='ism -2'
alias hla='hledger -f ~/Sync/finance/2020.ledger -f ~/Sync/finance/2021.ledger -f ~/Sync/finance/2022.ledger -f ~/Sync/finance/2023.ledger -f ~/Sync/finance/2024.ledger'
alias isa='hla is --drop 1'
alias issa='isa -2'

export AUTOSQL="select '    ', Miles, '  Miles' from fuel order by Date desc limit 1;"
alias auto='hla bal auto -f ~/Sync/finance/auto.ledger auto --drop 2
            sqlite3 -column ~/Sync/db/auto.db "$AUTOSQL"'
