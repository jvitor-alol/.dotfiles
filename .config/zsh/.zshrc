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

# Completion matching
zstyle ':completion:*' matcher-list \
    'm:{a-zA-Z}={A-Za-z}' \
    'r:|[._-]=* r:|=*'

# Interactive completion menu
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' group-name ''
zstyle ':completion:*' verbose yes
zstyle ':completion:*:descriptions' format '%F{yellow}-- %d --%f'
zstyle ':completion:*:warnings' format '%F{red}no matches found%f'
zstyle ':completion:*' squeeze-slashes true

# Zsh history substring search
source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

# Terminal keybindings
zmodload zsh/terminfo
bindkey -e

# Home / End
[[ -n "${terminfo[khome]}" ]] && bindkey "${terminfo[khome]}" beginning-of-line
[[ -n "${terminfo[kend]}"  ]] && bindkey "${terminfo[kend]}"  end-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line

# Delete / Backspace
[[ -n "${terminfo[kdch1]}" ]] && bindkey "${terminfo[kdch1]}" delete-char
bindkey '^[[3~' delete-char
bindkey '^?' backward-delete-char

# Insert
[[ -n "${terminfo[kich1]}" ]] && bindkey "${terminfo[kich1]}" overwrite-mode

# History navigation
[[ -n "${terminfo[kcuu1]}" ]] && bindkey "${terminfo[kcuu1]}" history-substring-search-up
[[ -n "${terminfo[kcud1]}" ]] && bindkey "${terminfo[kcud1]}" history-substring-search-down
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Page Up / Page Down
[[ -n "${terminfo[kpp]}" ]] && bindkey "${terminfo[kpp]}" up-history
[[ -n "${terminfo[knp]}" ]] && bindkey "${terminfo[knp]}" down-history

# Shift+Tab
[[ -n "${terminfo[kcbt]}" ]] && bindkey "${terminfo[kcbt]}" reverse-menu-complete

# Expand history references such as !! and !$ on Space
bindkey ' ' magic-space

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

# Zsh options
setopt appendhistory
setopt sharehistory
setopt inc_append_history
setopt extendedhistory
setopt hist_ignore_space
setopt hist_reduce_blanks
setopt hist_ignore_dups
setopt hist_expire_dups_first
setopt auto_cd
setopt interactive_comments
setopt rm_star_wait

# Aliases
if [ -f "$ZDOTDIR/aliases.zsh" ]; then
    . "$ZDOTDIR/aliases.zsh"
fi

# Starship prompt
eval "$(starship init zsh)"

# Zsh syntax highlighting
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
