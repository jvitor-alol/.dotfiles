# Migrating to a new setup

Install dependencies
```console
sudo apt install neofetch git zsh curl exa fzf ripgrep bat neovim
```

Add this line to /etc/zsh/zshenv
```console
export ZDOTDIR=$HOME/.config/zsh
```

Add bare repo alias to bashrc
```console
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles --work-tree=$HOME'" >> $HOME/.bashrc
```

Source bashrc
```bash
source ~/.bashrc
```

Clone bare repo
```bash
git clone --bare https://github.com/jvitor-alol/.dotfiles $HOME/.dotfiles
```

Force checkout
```bash
config checkout -f
```

Hide untracked files
```bash
config config --local status.showUntrackedFiles no
```

## References

[GitHub does dotfiles](https://dotfiles.github.io/)

[Harfang's Perch - Manage Dotfiles With a Bare Git Repository](https://harfangk.github.io/2016/09/18/manage-dotfiles-with-a-git-bare-repository.html)

[Jonathan Bowman - Dotfiles Part 2: A Bare Repo Approach to storing Home Directory Config Files in Git](https://www.bowmanjd.com/dotfiles/dotfiles-2-bare-repo/)

[Ackama - The best way to store your dotfiles: A bare Git repository **EXPLAINED**](https://www.ackama.com/what-we-think/the-best-way-to-store-your-dotfiles-a-bare-git-repository-explained/)
