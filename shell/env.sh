#!/usr/bin/env bash

# System-specific configuration

case $(uname -s) in
	"Darwin")
		alias ls="ls -Ah --color=always"
		;;
	"Linux")
		alias ls="ls -Ahv --color=auto --group-directories-first"
		alias ip="ip -c"
		;;
	*)
		echo "Unknown system type"
		;;
esac

# Environment variables

export HISTSIZE=
export EDITOR="nvim"
export BAT_THEME="ansi"
export FZF_DEFAULT_COMMAND="rg --hidden --files"
export FZF_DEFAULT_OPTS=" \
	--style=full \
	--border=rounded \
	--layout=reverse \
	--preview-window='right:60%' \
	--preview 'bat --color=always {}'"

# Aliases

alias cp="cp -iv"
alias mv="mv -iv"
alias grep="grep --color=auto --exclude-dir=.git"
alias diff="diff --color=auto"
alias watch="watch --color"
alias emacs="emacs -nw"

alias c="clear"
alias p="python3 -q"
alias t="tmux attach"
alias tk="tmux kill-session"
alias tl="tmux ls"
alias ff="fastfetch"
alias lg="lazygit"
alias ll="eza -Algh --icons=auto --group-directories-first --sort Name"
alias fze='env | sort | fzf --no-preview'
alias fza='alias | fzf --no-preview'
alias fzfonts='fc-list : family | sort | column --table --separator="," | fzf --no-preview'
alias glt='ghostty +list-themes'

alias pp="ping 1.1.1.1"
alias db="cd $DB_DIR"
alias dot='(cd "$HOME/dotfiles" && nvim -c FZF)'
alias www='(cd "$HOME/www" && nvim -c FZF)'

alias nvm="NVIM_APPNAME=nvim-maf nvim"
alias nvl="NVIM_APPNAME=nvim-lazyvim nvim"
