# bash customization
alias bashconfig='$EDITOR ~/.bashrc'	 		# edit .zshrc
alias aliasconfig='$EDITOR ~/.bash_aliases'		# edit .zsh_aliases

# dotfiles git command
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

# apt
alias aptu='sudo apt update'			 # update pkgs
alias aptg='sudo apt upgrade -y'	 	 # upgrade pkgs
alias apti='sudo apt install'			 # install pkgs
alias aptarm='sudo apt autoremove'		 # remove no longer needed dependencies

# pacman and yay
alias pacsyu='sudo pacman -Syu'                  # update only standard pkgs
alias pacsyyu='sudo pacman -Syyu'                # Refresh pkglist & update standard pkgs
alias yaysua='yay -Sua --noconfirm'		 # update only AUR pkgs
alias yaysyu='yay -Syu --noconfirm'              # update standard pkgs and AUR pkgs
alias unlock='sudo rm /var/lib/pacman/db.lck'    # remove pacman lock
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)' # remove orphaned packages (DANGEROUS!)

# git
alias addup='git add -u'			 # add only modified and deleted files
alias addall='git add .'			 # add all to staging area
alias branch='git branch'			 # branch command
alias allbranch='branch -vv -a'			 # list all branches including remote
alias switch='git switch'			 # switch to branch
alias checkout='git checkout'			 # checkout to branch
alias clone='git clone'				 # clone repository
alias commit='git commit -m'			 # commit with message
alias fetch='git fetch -pv'			 # fetch and prune stale branches, verbose
alias pull='git pull'				 # pull from remote
alias push='git push'				 # push to origin
alias stat='git status'				 # 'status' is protected name so using 'stat' instead
alias reflog='git reflog'			 # displays reflog
alias glog='git log'				 # displays commit log
alias tag='git tag'				 # list tags
alias newtag='git tag -a'			 # create new tag

# ps
alias psa='ps auxf'						# displays a hierarchical view of running processes
alias psgrep='ps aux | grep -v grep | grep -i -e VSZ -e'	# filters the process list to show lines that include "VSZ"
alias psmem='ps auxf | sort -nr -k 4'				# processes listed in descending order based on memory usage
alias pscpu='ps auxf | sort -nr -k 3'				# processes listed in descending order based on CPU usage

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

# Changing "ls" to "exa"
alias ls='exa -laa --icons --color=always --group-directories-first'	# my preferred listing
alias la='exa -a --icons --color=always --group-directories-first'	# all files and dirs
alias ll='exa -l --icons --color=always --group-directories-first'	# long format
alias lt='exa -aT --icons --color=always --group-directories-first'	# tree listing
alias l.='exa -a | rg "^\."'						# dotfiles

# Changing "cat" to "batcat"
alias cat='bat'

# Changing "vim" to "neovim"
alias vim='nvim'

# Changing "code" to "codium"
alias code='codium'

# Changing "grep" to "ripgrep" // Colorize grep output (good for log files)
alias grep='rg'

# Adding flags & misc.
alias cp='cp -i'			       		   # interactive copy
alias df='df -h'					   # human-readable disk space usage
alias free='free -m'					   # RAM usage, show sizes in MB
alias ghistory='history 1 | rg'			       	   # history with ripgrep
alias history='history -E'				   # history w/ timestamps
alias ips='ip -c -br a'			        	   # human-readable ip list
alias ip='ip -color=auto'				   # ip highlight
alias mkdir='mkdir -pv'			       		   # create directory structure
alias py='python3'					   # run python
alias wget='wget --hsts-file="$XDG_DATA_HOME/wget-hsts"'   # XDG-Compliance
