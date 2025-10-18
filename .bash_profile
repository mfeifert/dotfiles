# bash_profile

# https://wiki.archlinux.org/title/XDG_Base_Directory

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

mkdir -p "$XDG_CONFIG_HOME/git"
mkdir -p "$XDG_CONFIG_HOME/screen"
mkdir -p "$XDG_CONFIG_HOME/zsh"
mkdir -p "$XDG_STATE_HOME/bash"
mkdir -p "$XDG_STATE_HOME/vim"
mkdir -p "$XDG_CACHE_HOME/dvdcss"

export GOPATH="$HOME/vc/go"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
export NODE_REPL_HISTORY="$XDG_DATA_HOME/node_repl_history"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export W3M_DIR="$XDG_STATE_HOME/w3m"
export DVDCSS_CACHE="$XDG_CACHE_HOME/dvdcss"
export SCREENDIR="$XDG_RUNTIME_DIR/screen"

export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"

# Unable to clean up:
# ~/.dosbox/
# ~/.links/
# ~/.packettracer
