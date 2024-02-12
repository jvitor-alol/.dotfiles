# Migrating to a new setup

## Installing dependencies

Run the following line for Debian-based distributions
```console
sudo apt install neofetch git zsh curl exa fzf ripgrep bat neovim build-essential
```

Run the following line for Arch Linux
```console
sudo pacman -Syu neofetch git zsh curl exa fzf ripgrep bat neovim base-devel devtools
```

Install [yay](https://github.com/Jguer/yay) for [AUR](https://aur.archlinux.org/)
```console
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si
```

[Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

OMZ Plugins
```console
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting;
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions;
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use;
git clone https://github.com/asdf-vm/asdf.git ~/.asdf
```

[ASDF](https://github.com/asdf-vm/asdf) plugins
```console
asdf plugin-add python;
asdf plugin-add rust;
asdf plugin-add dotnet;
asdf install
```

Install [Starship Prompt](https://starship.rs/guide/#%F0%9F%9A%80-installation)
```console
curl -sS https://starship.rs/install.sh | sh
```

## Cloning dotfiles

Add bare repo alias to bashrc **OR** zshrc
```console
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.bashrc
```
```console
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.zshrc
```

Source bashrc **OR** zshrc
```console
source ~/.bashrc
```
```console
source ~/.zshrc
```

Clone bare repo
```console
git clone --bare git@github.com:jvitor-alol/.dotfiles.git $HOME/.dotfiles
```

Append this line to /etc/zsh/zshenv
```console
export ZDOTDIR=$HOME/.config/zsh
```

Run this command
```console
config config --edit
```

And add the the following lines to the configuration file
```toml
[core]
	repositoryformatversion = 0
	filemode = true
	bare = true
[status]
	showUntrackedFiles = no
[remote "origin"]
	url = git@github.com:jvitor-alol/.dotfiles.git
	fetch = +refs/heads/*:refs/remotes/origin/*
[branch "main"]
	remote = origin
	merge = refs/heads/main
```

Fetch branches
```console
config fetch
```

Force checkout
```console
config checkout -f
```

## Check for XDG compliant HOME

Install [XDG-Ninja](https://github.com/b3nj5m1n/xdg-ninja) (AUR)
```console
yaysyu xdg-ninja
```

Install XDG-Ninja and add it to PATH (Other distros)
```console
git clone https://github.com/b3nj5m1n/xdg-ninja.git $XDG_DATA_HOME
mkdir ~/.local/bin
cp $XDG_DATA_HOME/xdg-ninja/xdg-ninja.sh .local/bin/xdg-ninja 
```

## References

[GitHub does dotfiles](https://dotfiles.github.io/)

[Harfang's Perch - Manage Dotfiles With a Bare Git Repository](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

[Jonathan Bowman - Dotfiles Part 2: A Bare Repo Approach to storing Home Directory Config Files in Git](https://www.bowmanjd.com/dotfiles/dotfiles-2-bare-repo/)

[Ackama - The best way to store your dotfiles: A bare Git repository **EXPLAINED**](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)
