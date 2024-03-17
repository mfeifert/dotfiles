########
# bash #
########

# simple bash prompt for Fedora
BLUE="\e[1;34m"
RC="\e[0m" # reset color
PS1="${BLUE}[${RC}\u@\h \W${BLUE}]${RC}\\$ "

# simple bash prompt for Arch
BLUE="\e[1;38;2;51;170;221m"
RC="\e[0m" # reset color
PS1="${BLUE}[${RC}\u@\h \W${BLUE}]${RC}\\$ "

# colorful bash prompt from LARBS
PS1='\[\e[1;31m\][\[\e[1;33m\]\u\[\e[1;32m\]@\[\e[1;34m\]\h\[\e[1;35m\] \W\[\e[1;31m\]]\[\e[1;37m\]\$\e[0m '

#######
# zsh #
#######

# simple zsh prompt for Fedora
PROMPT="%B%F{blue}[%f%b%n@%m %1~%B%F{blue}]%f%b % "

# simple zsh prompt for Arch
BLUE="%F{51;170;221}"
PS1="${BLUE}[%f%n@%m %~${BLUE}]%f%# "

# colorful zsh prompt for macOS
PS1="%B%F{green}%n%F{yellow}@%F{red}%m %F{magenta}%1~ %F{blue}%# %f%b"

# colorful zsh prompt from LARBS
autoload -U colors && colors
PS1="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M %{$fg[magenta]%}%~%{$fg[red]%}]%{$reset_color%}$%b "
