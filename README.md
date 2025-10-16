# Quickstart
```sh
git clone https://github.com/Taloonys/dotfiles.git ~/dotfiles && cd ~/dotfiles

cp ./.gitconfig.in ~/.gitconfig # and change there ur info

ln -s ~/.config/nvim/ ./dotfiles/nvim/
ln -s ~/.config/starship.toml ./dotfiles/starship.toml
ln -s ~/.tmux.conf ./dotfiles/.tmux.conf
```

# Remind for submodules
```sh
# pull with submodules
git pull --recurse-submodules

# if pulled without, then init submodules content in repo
git submodule update --init
```
