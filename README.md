# Quickstart
> There is a high chance, that you have to change `~` or actual `C:/Users/<username>` path
```sh
git clone https://github.com/Taloonys/dotfiles.git ~/dotfiles && cd ~/dotfiles
sudo cmd /c mklink /d ~\AppData\local\nvim ~\dotfiles\nvim
sudo cmd /c mklink ~\.gitconfig ~\dotfiles\.gitconfig
sudo cmd /c mklink /d ~\.config\wezterm ~\dotfiles\wezterm
sudo cmd /c mklink ~\.config\starship.toml ~\dotfiles\starship.toml
```

# Notes
* This branch is more experimental, also ok for linux, but currently used for C++ based working env on **Windows**

# Remind for submodules
```sh
# pull with submodules
git pull --recurse-submodules

# if pulled without, then init submodules content in repo
git submodule --init
```
