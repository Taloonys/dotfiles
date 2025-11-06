# Quickstart
> We are placing `dotfiles` into `~`
* clone repo
```sh
git clone https://github.com/Taloonys/dotfiles.git ~/dotfiles && cd ~/dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux plugins manager
```
* setup basic stuff
```sh
sudo apt-get install -y unzip golang-go rustc cargo python3 python-venv delve zip lazygit ripgrep nodejs
```
* create softlinks
    * it must be done before installing main tools
```sh
ln -svf ~/dotfiles/fish ~/.config/fish
ln -svf ~/dotfiles/nvim ~/.config/nvim
ln -svf ~/dotfiles/tmux ~/.config/tmux
ln -svf ~/dotfiles/starship.toml ~/.config/starship.toml
```
* install a rest of stuff
```sh
sudo apt-get install -y nvim fish tmux
```
* *(possible) if old linux -> install `homebrew`, cuz we need nvim>=0.11*
```sh
brew install neovim
```
* copy template for gitconfig + fill ur credentails
```sh
cp ~/dotfiles/.gitconfig.in ~/.gitconfig # and change there ur info <-> cuz it's pure template
```
* ~~suffer~~ enjoy

# Remind for submodules
```sh
# pull with submodules
git pull --recurse-submodules

# if pulled without, then init submodules content in repo
git submodule update --init
```
