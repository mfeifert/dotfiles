# .bash_profile

# https://wiki.archlinux.org/title/XDG_Base_Directory

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CACHE_HOME="$HOME/.cache"

# ~/.config
export SCREENRC="$XDG_CONFIG_HOME/screen/screenrc"

# ~/.local/state
export HISTFILE="$XDG_STATE_HOME/bash_history"
export PYTHON_HISTORY="$XDG_STATE_HOME/python_history"
export SQLITE_HISTORY="$XDG_STATE_HOME/sqlite_history"
export W3M_DIR="$XDG_STATE_HOME/w3m"

# /run/user/$UID
export SCREENDIR="$XDG_RUNTIME_DIR/screen"

# hard-coded
# ~/.dosbox/
# ~/.links/
# ~/.stellarium/
# ~/.packettracer
