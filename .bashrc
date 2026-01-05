# .bashrc

source /etc/bashrc

eval "$(fzf --bash)"

PS1='\$ '
export AWKPATH="$HOME/vc/scripts"
export BAT_THEME="ansi"
export DATA_DIR="$HOME/Documents/data"
export EDITOR="nvim"
export GOPATH="$HOME/vc/go"
export LEDGER_FILE="$HOME/Documents/finance/current_year.ledger"
export MANPAGER="sh -c 'col --spaces --no-backspaces | bat --plain --language man'"
export MANROFFOPT="-c"
export NOTES_DIR="$HOME/Documents/notes"
export PATH="$HOME/vc/scripts:$PATH"
export PATH="$HOME/vc/scripts-private:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export SHOWS_MEDIA_DIR="/run/media/$USER/External/video/TV Shows"
export VERSION_CONTROL="never" # used by GNU indent
export FZF_ALT_C_OPTS="--no-preview"
export FZF_CTRL_R_OPTS="--no-preview"
export FZF_DEFAULT_COMMAND="rg --hidden --files"
export FZF_DEFAULT_OPTS="
	--border=rounded \
	--layout=reverse \
	--preview-window='right:60%' \
	--preview 'bat --color=always {}' \
	--style=full"

# Default options
alias diff="diff --color=auto"
alias gcc="gcc -Wall --pedantic"
alias grep="grep --color=auto --exclude-dir=.git"
alias ip="ip -c"
alias ls="ls -Ahv --color=auto --group-directories-first"

# Shortcuts
alias ll="ls -l"
alias n="(cd "$HOME/Documents/notes"; f)"
alias p="python3 -q"
alias vim="vimx"
alias www="(cd "$HOME/vc/www"; f)"

# Utilities
alias dot="/usr/bin/git --git-dir=${HOME}/vc/dotfiles/ --work-tree=${HOME}"
alias fza="alias | fzf --no-preview"
alias fze="env | sort | fzf --no-preview"
alias fzfonts="fc-list : family | sort | column --table --separator=',' | fzf --no-preview"
alias gits="gits | column -t -s $'\t'"
alias nvl="NVIM_APPNAME=nvim-lazyvim nvim"
alias pp="ping 1.1.1.1"

# ledger & hledger
alias ledger="ledger -f $LEDGER_FILE"
alias hledger="hledger --pretty --strict"
alias hla="hledger -f ~/Documents/finance/master.ledger" # hledger all
alias reg="hledger reg -p thismonth"                     # register
alias bs="clear && hledger bs --drop 1"                  # balance sheet
alias bsm="bs -M"                                        # balance sheet monthly
alias is="clear && hledger is --drop 1 -S -b thismonth"  # income statement
alias ism="clear && hledger is --drop 1 -MST"            # income statement monthly
alias iss="is -2"                                        # income statement short
alias issm="ism -2"                                      # income statement short monthly
alias isa="hla is --drop 1"                              # income statement all
alias issa="isa -2"                                      # income statement short all

# Functions
source $HOME/vc/scripts/task-functions

f() {
	file=$(fzf)
	[[ -n $file ]] && $EDITOR "$file"
}

h() {
	"$@" --help 2>&1 | bat --plain --language="help"
}

dots() {(
	cd $HOME
	file=$(dot ls | fzf)
	[[ -n $file ]] && $EDITOR "$file"
)}
