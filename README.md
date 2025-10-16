# Features
* Wezterm -> optionally
* Starship -> also optionally
* nvim is clear -> doesn't require any C-compiler

# Quickstart
> There is a high chance that you have to swap '~' with your actual 'C:/Users/<name>'
```sh
git clone https://github.com/Taloonys/dotfiles.git ~/dotfiles && cd ~/dotfiles
cp ./gitconfig.in ~/.gitconfig # + change your info
sudo cmd /c mklink /d ~\AppData\local\nvim ~\dotfiles\nvim
sudo cmd /c mklink /d ~\.config\wezterm ~\dotfiles\wezterm
sudo cmd /c mklink ~\.config\starship.toml ~\dotfiles\starship.toml
```

# Remind for submodules
```sh
# pull with submodules
git pull --recurse-submodules

# if pulled without, then init submodules content in repo
git submodule update --init
```
