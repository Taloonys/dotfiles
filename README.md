# Requirements

- brewhome (if old linux distro - built-in package manager could not be enough)
- starship -> https://starship.rs/

```sh
# prb sth like this
curl -sS https://starship.rs/install.sh | sh
```

- insane mental stuff

- NerdFonts (I used FiraCode)

# Quickstart

> We are placing `dotfiles` into `~`

- clone repo

```sh
git clone https://github.com/Taloonys/dotfiles.git ~/dotfiles && cd ~/dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux plugins manager
```

- setup basic utils, example for ubuntu24.04 (as most commonly used)

```sh
brew install eza fd bat rg \
     unzip golang-go rustc cargo python3 python-venv delve zip nodejs \
     lazydocker lazygit \
     nvim fish tmux
```

> full list is sth like this, but it could be different for different versions and package managers and so on...

```
eza
fd
bat
rg
unzip
rust cargo
python3
zip
lazygit
lazydocker
tmux
nvim
fish
```

- create softlinks
  - it must be done before installing main tools

```sh
rm -rf ~/.config/fish && ln -svf ~/dotfiles/fish ~/.config/fish
rm -rf ~/.config/nvim && ln -svf ~/dotfiles/nvim ~/.config/nvim
rm -rf ~/.config/tmux && ln -svf ~/dotfiles/tmux ~/.config/tmux
rm -rf ~/.config/tmux && ln -svf ~/dotfiles/starship.toml ~/.config/starship.toml
```

- copy template for gitconfig + fill ur credentails

```sh
cp ~/dotfiles/.gitconfig.in ~/.gitconfig
# !!! and change there ur info <-> cuz it's pure template
```

- **while in terminal with tmux -> press `<leader>i`**, currently for tmux it's `Space+Ctrl`

- ~~suffer~~ enjoy

# Remind for submodules

```sh
# pull with submodules
git pull --recurse-submodules

# if pulled without, then init submodules content in repo
git submodule update --init
```

# Uninstall

- symlinks and repo

```sh
# drop any dir/file if it's a symlink
for path in ~/.config/fish ~/.config/nvim ~/.config/tmux ~/.config/starship.toml; do
  if [ -L "$path" ]; then
    echo "Removing symlink: $path"
    rm -f "$path"
  else
    echo "Skipping $path (not a symlink)"
  fi
done

# drom tpm plugins manager
rm -rf ~/.tmux/plugins/tpm

# self distruction
rm -rf ~/dotfiles
```

- packages
  - but i exlcuded basic packages

```sh
brew remove --purge -y golang-go rustc cargo python3 python3-venv delve lazygit lazydocker nodejs remove fish tmux neovim
```
