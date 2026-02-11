# Add following line to /etc/zsh/zshenv
export ZDOTDIR=$HOME/.config/zsh

# XDG Base Directory (https://wiki.archlinux.org/title/XDG_Base_Directory)
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# XDG-Ninja recommendations
export ZSH="$XDG_DATA_HOME"/oh-my-zsh
export HISTFILE="$XDG_STATE_HOME"/zsh/history
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export GPG_TTY=$(tty) # Setup for the gpg-agent
export DOCKER_CONFIG="$XDG_CONFIG_HOME"/docker
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export PYTHONSTARTUP="$XDG_CONFIG_HOME"/python/pythonrc
export PYTHON_HISTORY="$XDG_STATE_HOME"/python_history
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export WINEPREFIX="$XDG_DATA_HOME"/wine
export XCURSOR_PATH=/usr/share/icons:$XDG_DATA_HOME/icons
export GTK2_RC_FILES="$XDG_CONFIG_HOME"/gtk-2.0/gtkrc
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages # .NET package manager
export ASDF_DATA_DIR="$XDG_DATA_HOME"/asdf
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export PSQL_HISTORY="$XDG_DATA_HOME/psql_history"

# User-specific executable files may be stored in $HOME/.local/bin.
# (https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$PATH:$HOME/.local/bin
fi
