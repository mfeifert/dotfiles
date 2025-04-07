# Create directories and set variables for applications
# that are only partially XDG-compatible.
#
# Check https://wiki.archlinux.org/title/XDG_Base_Directory
# periodically for updates.

# Source this file in ~/.bash_profile or ~/.zshenv

# Unable to clean up:
# ~/.dosbox/
# ~/.links/
# ~/.packettracer

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

mkdir -p "$XDG_CONFIG_HOME/zsh"
mkdir -p "$XDG_CONFIG_HOME/git"
mkdir -p "$XDG_CONFIG_HOME/screen"
mkdir -p "$XDG_STATE_HOME/bash"
mkdir -p "$XDG_CACHE_HOME/dvdcss"

export GOPATH="$HOME/projects/go"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export DVDCSS_CACHE="$XDG_CACHE_HOME/dvdcss"
export W3M_DIR="$XDG_STATE_HOME/w3m"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

case $(uname -s) in
	"Darwin")
		export LESSHISTFILE="$XDG_STATE_HOME/lesshst"
		alias vim='nvim'
		;;
	"Linux")
		export SCREENDIR="$XDG_RUNTIME_DIR/screen"
		mkdir -p "$XDG_STATE_HOME/vim"
		;;
	*)
		echo "Unknown system type"
		;;
esac

# To be placed in .bashrc
# export HISTFILE="$XDG_STATE_HOME/bash/history"

# To be placed in .bashrc if necessary
# alias dict='dict -c "$XDG_CONFIG_HOME/dict/dictrc"'
