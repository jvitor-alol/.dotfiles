# ~/.config/zsh/.zshrc
# Preferred editor
export EDITOR='helix'
export VISUAL='helix'
export SUDO_EDITOR='helix'

# Zsh completion
if [ ! -d "$XDG_CACHE_HOME/zsh" ]; then
    mkdir -p "$XDG_CACHE_HOME/zsh"
fi

autoload -Uz compinit
compinit -d "$XDG_CACHE_HOME/zsh/zcompdump-$ZSH_VERSION"

# Zsh history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Zsh autosuggestions
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

# Zsh history
if [ ! -d "$XDG_STATE_HOME/zsh" ]; then
    mkdir -p "$XDG_STATE_HOME/zsh"
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

# Aliases
if [ -f "$ZDOTDIR/.aliases" ]; then
    . "$ZDOTDIR/.aliases"
fi

# Starship prompt
eval "$(starship init zsh)"

# Zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
