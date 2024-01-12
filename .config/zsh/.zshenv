# XDG Base Directory (https://wiki.archlinux.org/title/XDG_Base_Directory)
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

#XDG-Compliance
export WINEPREFIX="$XDG_DATA_HOME"/wine
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export WINEPREFIX="$XDG_DATA_HOME"/wine

# Add ~/Development/bin to PATH
export PATH=$PATH:$HOME/Development/bin

# Add .NET to PATH
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

# Add Linuxbrew to PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH

# Add pgAdmin4 folder to PATH
export PATH=$PATH:/usr/pgadmin4/bin

# rustup
. "$HOME/.cargo/env"

# Add Voldemort folder to ambient variables
export VOLD=$HOME/Development/senhaseguraLinux
