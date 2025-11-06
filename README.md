# Quickstart
> We are placing `dotfiles` into `~`
> BTW: if you insist on changing `dotfiles` location, than don't forget to specify absolute path's below
* setup a bunch of stuff
```sh
sudo apt-get install unzip golang-go rustc cargo python3 python-venv delve zip lazygit ripgrep nodejs
```
* create softlinks
```sh
git clone https://github.com/Taloonys/dotfiles.git ~/dotfiles && cd ~/dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux plugins manager

cp ~/dotfiles/.gitconfig.in ~/.gitconfig # and change there ur info <-> cuz it's pure template

ln -s ~/dotfiles/nvim ~/.config/nvim 
ln -s ~/dotfiles/tmux ~/.config/tmux
ln -s ~/dotfiles/starship.toml ~/.config/starship.toml
```

# Remind for submodules
```sh
# pull with submodules
git pull --recurse-submodules

# if pulled without, then init submodules content in repo
git submodule update --init
```
