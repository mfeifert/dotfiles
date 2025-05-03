########
# bash #
########

# simple bash prompt for Fedora
BLUE="\e[1;34m" # bold blue
BOLD="\e[1;0m"
RESET="\e[0m"
PS1="${BLUE}[${BOLD}\u@\h \W${BLUE}]${RESET}\\$ "

# simple bash prompt for Arch
BLUE="\e[1;38;2;51;170;221m"
RESET="\e[0m"
PS1="${BLUE}[${RESET}\u@\h \W${BLUE}]${RESET}\\$ "

# colorful bash prompt from LARBS
red="\e[1;31m"
yellow="\e[1;33m"
green="\e[1;32m"
blue="\e[1;34m"
purple="\e[1;35m"
bold="\e[1;0m"
reset="\e[0m"
PS1="${red}[${yellow}\u${green}@${blue}\h${purple} \W${red}]${bold}$ ${reset}"

# colorful bash prompt from LARBS with git status indicator
red="\e[1;31m"
yellow="\e[1;33m"
green="\e[1;32m"
blue="\e[1;34m"
purple="\e[1;35m"
bold="\e[1;0m"
reset="\e[0m"
git_status_indicator()
{
	if git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
		if [[ -z $(git status --porcelain) ]]; then
			git=" ${green}*${reset} "
		else
			git=" ${red}*${reset} "
		fi
	else
		git=""
	fi
	PS1="${red}[${yellow}\u${green}@${blue}\h ${purple}\W${red}]${git}${bold}$ ${reset}"
}
PROMPT_COMMAND="git_status_indicator"

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
