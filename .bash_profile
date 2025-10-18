# bash_profile

# https://wiki.archlinux.org/title/XDG_Base_Directory

# ~/.config
export XDG_CONFIG_HOME="$HOME/.config"
mkdir -p "$XDG_CONFIG_HOME/screen"
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"
mkdir -p "$XDG_CONFIG_HOME/zsh"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

# ~/.local/share
export XDG_DATA_HOME="$HOME/.local/share"

# ~/.local/state
export XDG_STATE_HOME="$HOME/.local/state"
mkdir -p "$XDG_STATE_HOME/bash"
mkdir -p "$XDG_STATE_HOME/vim"
export NODE_REPL_HISTORY="$XDG_STATE_HOME/node_repl_history"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export W3M_DIR="$XDG_STATE_HOME/w3m"

# ~/.cache
export XDG_CACHE_HOME="$HOME/.cache"
mkdir -p "$XDG_CACHE_HOME/dvdcss"
export DVDCSS_CACHE="$XDG_CACHE_HOME/dvdcss"

export GOPATH="$HOME/vc/go"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$GOPATH/bin:$PATH"
export SCREENDIR="$XDG_RUNTIME_DIR/screen"

# hard-coded
# ~/.dosbox/
# ~/.links/
# ~/.packettracer
