# .bashrc

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

eval "$(atuin init bash)"

PS1='\W \$ '
export AWKPATH="$HOME/vc/scripts"
export BAT_THEME="ansi"
export DATA_DIR="$HOME/Documents/data"
export EDITOR="nvim"
export LEDGER_FILE="$HOME/Documents/finance/current_year.ledger"
export MANPAGER="sh -c 'col --spaces --no-backspaces | bat --plain --language man'"
export MANROFFOPT="-c"
export PATH="$HOME/vc/scripts:$PATH"
export PATH="$HOME/vc/scripts-private:$PATH"
export SHOWS_MEDIA_DIR="/run/media/$USER/Media/video/TV Shows"
export VERSION_CONTROL="never" # used by GNU indent
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
alias www="(cd "$HOME/vc/www"; f)"

# Utilities
alias dot='/usr/bin/git --git-dir=${HOME}/vc/dotfiles/ --work-tree=${HOME}'
alias fza="alias | fzf --no-preview"
alias fze="env | sort | fzf --no-preview"
alias fzfonts="fc-list : family | sort | column --table --separator=',' | fzf --no-preview"
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

f() {
	file=$(fzf)
	[[ -n $file ]] && nvim "$file"
}

h() {
	"$@" --help 2>&1 | bat --plain --language="help"
}

task() {
	if [[ $1 == "e" ]]; then
		(cd "$DATA_DIR/task" && f)
	else
		clear
		task-dashboard
		echo
	fi
}

tt() {
	task-todo "$@"
	task
}

td() {
	task-daily "$@"
	[[ $1 != "a" ]] && task
}

tm() {
	task-monthly "$@"
	[[ $1 != "a" ]] && task
}
