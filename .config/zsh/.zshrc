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

# Preferred editor
export EDITOR='helix'
export VISUAL='helix'
export SUDO_EDITOR='helix'

# Update reminder
zstyle ':omz:update' mode reminder

# Oh My Zsh plugins
plugins=(
  zsh-autosuggestions
  zsh-syntax-highlighting
  you-should-use
)

source $ZSH/oh-my-zsh.sh

# Zcompdump location
compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

######## USER CONFIGURATION ########

# Zsh history
if [ ! -d "$XDG_STATE_HOME/zsh" ]; then
	mkdir -p $XDG_STATE_HOME/zsh
fi
if [ ! -e "$HISTFILE" ]; then
	touch "$HISTFILE"
fi
HISTSIZE=20000
SAVEHIST=10000

setopt appendhistory
setopt sharehistory
setopt inc_append_history
setopt extendedhistory
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_ignore_dups
setopt hist_expire_dups_first

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

# My aliases
if [ -f $ZDOTDIR/.aliases ]; then
    . $ZDOTDIR/.aliases
fi

# Starship prompt
eval "$(starship init zsh)"
