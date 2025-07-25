#
# bashrc
#

# Environment variables

export BAT_THEME="ansi"
export EDITOR="nvim"
export HISTFILE="$XDG_STATE_HOME/bash/history"
export HISTSIZE=
export VERSION_CONTROL="never" # used by GNU indent
export FZF_DEFAULT_COMMAND="rg --hidden --files"
export FZF_DEFAULT_OPTS="
	--border=rounded \
	--layout=reverse \
	--preview-window='right:60%' \
	--preview 'bat --color=always {}' \
	--style=full"

# Aliases

## default options
alias cp="cp -i"
alias diff="diff --color=auto"
alias emacs="emacs -nw"
alias eza="eza -Agh --icons=auto --group-directories-first --sort Name"
alias gcc="gcc -Wall --pedantic"
alias grep="grep --color=auto --exclude-dir=.git"
alias ip="ip -c"
alias ls="ls -Ahv --color=auto --group-directories-first"
alias mv="mv -i"
alias watch="watch --color"

## shortcuts
alias c="clear"
alias glk="ghostty +list-keybinds"
alias glt="ghostty +list-themes"
alias gr="go run ."
alias lg="lazygit"
alias ll="ls -l"
alias n="(cd $NOTES_DIR && f)"
alias p="python3 -q"
alias sc="shellcheck"
alias t="tmux attach"
alias tk="tmux kill-session"
alias tl="tmux ls"

## utilities
alias fza="alias | fzf --no-preview"
alias fze="env | sort | fzf --no-preview"
alias fzfonts="fc-list : family | sort | column --table --separator=',' | fzf --no-preview"
alias pp="ping 1.1.1.1"

# Functions

task()
{
	if [[ $1 == "e" ]]; then
		(cd "$TASK_DATA_DIR" && nvim -c FZF)
	else
		clear
		task-dashboard
		echo
	fi
}

tt()
{
	task-todo "$@"
	task
}

td()
{
	task-daily "$@"
	[[ $1 != "a" ]] && task
}

tm()
{
	task-monthly "$@"
	[[ $1 != "a" ]] && task
}

f()
{
	file=$(fzf)
	[[ -n $file ]] && nvim $file
}
