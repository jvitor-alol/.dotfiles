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

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='lvim'
else
  export EDITOR='lvim'
fi

# Update reminder
zstyle ':omz:update' mode reminder

# Default theme
# ZSH_THEME="af-magic"

# Oh My Zsh plugins
# Add wisely, as too many plugins slow down shell startup.
plugins=(
	zsh-syntax-highlighting
	history-substring-search
	autojump
	zsh-autosuggestions
	you-should-use
	asdf
	poetry
)

source $ZSH/oh-my-zsh.sh

# Zcompdump location // doesn't really work with oh-my-zsh installed
# compinit -d "$XDG_CACHE_HOME"/zsh/zcompdump-"$ZSH_VERSION"

######## USER CONFIGURATION ########

# Zsh history
if [ ! -d "$XDG_STATE_HOME/zsh" ]; then
	mkdir -p $XDG_STATE_HOME/zsh
fi
if [ ! -e "$HISTFILE" ]; then
	touch "$HISTFILE"
fi
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

# My aliases
if [ -f $ZDOTDIR/.aliases ]; then
    . $ZDOTDIR/.aliases
fi

# Starship prompt
eval "$(starship init zsh)"

