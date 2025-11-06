# Pre-requirements
* brewhome (if old linux distro - built-in package manager could not be enough)
* insane mental state
* be ready to do everything step by step
* be ready for a lot of stuff installed...

# Quickstart
> We are placing `dotfiles` into `~`
* clone repo
```sh
git clone https://github.com/Taloonys/dotfiles.git ~/dotfiles && cd ~/dotfiles
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm # tmux plugins manager
```
* setup basic stuff
```sh
brew install unzip golang-go rustc cargo python3 python-venv delve zip lazydocker lazygit ripgrep nodejs
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
brew install -y nvim fish tmux neovim
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

# Uninstall 
* symlinks and repo
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
* packages
    * but i exlcuded basic packages
```sh
brew remove --purge -y golang-go rustc cargo python3 python3-venv delve lazygit lazydocker nodejs remove fish tmux neovim
```
