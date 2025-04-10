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
alias grep="grep --color=auto --exclude-dir=.git"
alias mv="mv -i"
alias watch="watch --color"

## shortcuts
alias c="clear"
alias ff="fastfetch"
alias glk="ghostty +list-keybinds"
alias glt="ghostty +list-themes"
alias lg="lazygit"
alias p="python3 -q"
alias t="tmux attach"
alias tk="tmux kill-session"
alias tl="tmux ls"

## utilities
alias fze="env | sort | fzf --no-preview"
alias fza="alias | fzf --no-preview"
alias fzfonts="fc-list : family | sort | column --table --separator=',' | fzf --no-preview"
alias pp="ping 1.1.1.1"
