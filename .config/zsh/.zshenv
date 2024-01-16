# Add following line to /etc/zsh/zshenv
export ZDOTDIR=$HOME/.config/zsh

# XDG Base Directory (https://wiki.archlinux.org/title/XDG_Base_Directory)
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

# XDG-Ninja recommendations
export WINEPREFIX="$XDG_DATA_HOME"/wine
export RUSTUP_HOME="$XDG_DATA_HOME"/rustup
export IPYTHONDIR="$XDG_CONFIG_HOME/ipython"
export LESSHISTFILE="$XDG_STATE_HOME"/less/history
export WINEPREFIX="$XDG_DATA_HOME"/wine
export PYTHONSTARTUP="/etc/python/pythonrc"
export OMNISHARPHOME="$XDG_CONFIG_HOME"/omnisharp
export CARGO_HOME="$XDG_DATA_HOME"/cargo
export CUDA_CACHE_PATH="$XDG_CACHE_HOME"/nv
export GNUPGHOME="$XDG_DATA_HOME"/gnupg
export NUGET_PACKAGES="$XDG_CACHE_HOME"/NuGetPackages
export ZSH="$XDG_DATA_HOME"/oh-my-zsh

# User-specific executable files may be stored in $HOME/.local/bin.
# (https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
if [ -d "$HOME/.local/bin" ]; then
    export PATH=$PATH:$HOME/.local/bin
fi

# Add .NET to PATH
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

# Add Linuxbrew to PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH

# Add pgAdmin4 folder to PATH
export PATH=$PATH:/usr/pgadmin4/bin

# Add Voldemort folder to ambient variables
export VOLD=$HOME/Development/senhaseguraLinux

