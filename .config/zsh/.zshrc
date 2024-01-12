#############################################################################
#|----------__-------------------------------------------------------------|#
#|---------|  \------------------------------------------------------------|#
#|---------| ▓▓____   ______   _______  _______ __    __ _______-----------|#
#|---------| ▓▓    \ /      \ /       \/       \  \  |  \       \----------|#
#|---------| ▓▓▓▓▓▓▓\  ▓▓▓▓▓▓\  ▓▓▓▓▓▓▓  ▓▓▓▓▓▓▓ ▓▓  | ▓▓ ▓▓▓▓▓▓▓\---------|#
#|---------| ▓▓  | ▓▓ ▓▓  | ▓▓\▓▓    \ \▓▓    \| ▓▓  | ▓▓ ▓▓  | ▓▓---------|#
#|---------| ▓▓__/ ▓▓ ▓▓__/ ▓▓_\▓▓▓▓▓▓\_\▓▓▓▓▓▓\ ▓▓__/ ▓▓ ▓▓  | ▓▓---------|#
#|---------| ▓▓    ▓▓\▓▓    ▓▓       ▓▓       ▓▓\▓▓    ▓▓ ▓▓  | ▓▓---------|#
#|----------\▓▓▓▓▓▓▓  \▓▓▓▓▓▓ \▓▓▓▓▓▓▓ \▓▓▓▓▓▓▓  \▓▓▓▓▓▓ \▓▓   \▓▓---------|#
#|-------------------------------------------------------------------------|#
#############################################################################

# Path to oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='nano'
else
  export EDITOR='vim'
fi

# Update reminder
zstyle ':omz:update' mode reminder

# Default theme
ZSH_THEME="af-magic"

# Oh My Zsh plugins
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-syntax-highlighting
	history-substring-search
	autojump
	zsh-autosuggestions
	you-should-use
	auto-notify
	starship
)

source $ZSH/oh-my-zsh.sh

# XDG Base Directory (https://wiki.archlinux.org/title/XDG_Base_Directory)
export XDG_CONFIG_HOME=$HOME/.config
export XDG_CACHE_HOME=$HOME/.cache
export XDG_DATA_HOME=$HOME/.local/share
export XDG_STATE_HOME=$HOME/.local/state

######## USER CONFIGURATION ########

# Zsh history
export HISTFILE=$XDG_STATE_HOME/zsh/history
HISTSIZE=4096
SAVEHIST=4096
setopt appendhistory

# Arquive extraction
ex ()		# usage: ex <file>
{
  if [ -f "$1" ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1   ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *.deb)       ar x $1      ;;
      *.tar.xz)    tar xf $1    ;;
      *.tar.zst)   unzstd $1    ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# Aliases
if [ -f $ZDOTDIR/.zsh_aliases ]; then
    . $ZDOTDIR/.zsh_aliases
fi

# Add ~/Development/bin to PATH
export PATH=$PATH:$HOME/Development/bin

# Add .NET to PATH
export DOTNET_ROOT=$HOME/.dotnet
export PATH=$PATH:$HOME/.dotnet:$HOME/.dotnet/tools

# Add Linuxbrew to PATH
export PATH=/home/linuxbrew/.linuxbrew/bin:/home/linuxbrew/.linuxbrew/sbin:$PATH

# Add pgAdmin4 folder to PATH
export PATH=$PATH:/usr/pgadmin4/bin

# Add Voldemort folder to ambient variables
export VOLD=$HOME/Development/senhaseguraLinux
