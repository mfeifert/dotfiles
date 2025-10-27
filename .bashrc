# .bashrc

if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

source "$HOME/vc/dotfiles-private/bashrc"

eval "$(atuin init bash)"

PS1='\W \$ '
export BAT_THEME="ansi"
export EDITOR="nvim"
export GUM_FILTER_SHOW_HELP="no"
export MANPAGER="sh -c 'col --spaces --no-backspaces | bat --plain --language man'"
export MANROFFOPT="-c"
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
alias emacs="emacs -nw"
alias eza="eza -Agh --icons=auto --group-directories-first --sort Name"
alias gcc="gcc -Wall --pedantic"
alias grep="grep --color=auto --exclude-dir=.git"
alias ip="ip -c"
alias ls="ls -Ahv --color=auto --group-directories-first"
alias watch="watch --color"

# Shortcuts
alias c="clear"
alias ll="ls -l"
alias n="(cd $NOTES_DIR; f)"
alias p="python3 -q"
alias s="shows"

# Utilities
alias dot='/usr/bin/git --git-dir=${HOME}/vc/dotfiles/ --work-tree=${HOME}'
alias fza="alias | fzf --no-preview"
alias fze="env | sort | fzf --no-preview"
alias fzfonts="fc-list : family | sort | column --table --separator=',' | fzf --no-preview"
alias pp="ping 1.1.1.1"

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
		(cd "$TASK_DATA_DIR" && f)
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
