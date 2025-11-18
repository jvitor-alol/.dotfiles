# Migrating to a new setup

## Installing dependencies

Run the following line for Debian-based distributions
```console
sudo apt install git zsh curl neovim build-essential
```

Run the following line for Arch Linux
```console
sudo pacman -Syu git curl base-devel
```

Install [paru](https://github.com/Morganamilo/paru) for [AUR](https://aur.archlinux.org/)
```console
sudo pacman -S --needed base-devel;
git clone https://aur.archlinux.org/paru.git;
cd paru;
makepkg -si
```

Install from `pkglist` (Arch Linux)
```console
curl -fsSL https://raw.githubusercontent.com/jvitor-alol/.dotfiles/refs/heads/main/pkglist.txt | paru -Syu --needed -
```

Install `flatpaks`
```console
curl -fsSL https://raw.githubusercontent.com/jvitor-alol/.dotfiles/refs/heads/main/flatpaks.txt | xargs -n1 flatpak install -y flathub
```

Install [LunarVim](https://www.lunarvim.org/docs/installation)
```console
LV_BRANCH='release-1.4/neovim-0.9' bash <(curl -s https://raw.githubusercontent.com/LunarVim/LunarVim/release-1.4/neovim-0.9/utils/installer/install.sh)
```


[Oh-My-Zsh](https://github.com/ohmyzsh/ohmyzsh)
```console
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

OMZ Plugins
```console
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use
ln -s /usr/share/zsh/plugins/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
ln -s /usr/share/zsh/plugins/zsh-syntax-highlighting $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
```

[ASDF](https://github.com/asdf-vm/asdf) plugins
```console
asdf plugin add python;
asdf plugin add nodejs;
asdf install
```

## Cloning dotfiles

Add bare repo alias to bashrc **OR** zshrc
```console
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.bashrc
```
```console
echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.zshrc
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

Edit the configuration file and add the the following lines 

```console
dotfiles config --edit
```

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

Fetch branches and run the following
```console
dotfiles fetch;
dotfiles remote set-head origin main
```

Force checkout
```console
dotfiles checkout -f
```

## Check for XDG compliant HOME

Install [XDG-Ninja](https://github.com/b3nj5m1n/xdg-ninja) (AUR)
```console
parusua xdg-ninja
```

## VSCodium extensions

To list installed extensions
```console
code --list-extensions > extensions.txt
```

To install a extension
```console
code --install-extension <ext-id | path>
```

## References

[GitHub does dotfiles](https://dotfiles.github.io/)

[Harfang's Perch - Manage Dotfiles With a Bare Git Repository](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

[Jonathan Bowman - Dotfiles Part 2: A Bare Repo Approach to storing Home Directory Config Files in Git](https://www.bowmanjd.com/dotfiles/dotfiles-2-bare-repo/)

[Ackama - The best way to store your dotfiles: A bare Git repository **EXPLAINED**](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)

[GPG + Git basics: How to generate keys, sign commits, and export keys to another machine](https://aalonso.dev/blog/2022/how-to-generate-gpg-keys-sign-commits-and-export-keys-to-another-machine)

