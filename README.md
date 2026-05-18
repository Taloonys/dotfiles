# What is special?
- nvim doesn't require any compilers

# Requirements
* Wezterm
* Starship
* nvim
* yazi
* Zed (OPTIONAL, just a transparent experiment.. just use nvim)

# Quickstart
> There is a high chance that you have to swap '~' with your actual 'C:/Users/<name>' -> do only absolute ways
```sh
git clone https://github.com/Taloonys/dotfiles.git ~/dotfiles && cd ~/dotfiles
cp ./gitconfig.in ~/.gitconfig # + change your info
```
* From admin open powershell (newer versions on windows can sudo)
```sh
cmd /c mklink /d "%USERPROFILE%\AppData\Local\nvim" "%USERPROFILE%\dotfiles\nvim"
cmd /c mklink /d "%USERPROFILE%\.config\wezterm" "%USERPROFILE%\dotfiles\wezterm"
cmd /c mklink "%USERPROFILE%\.config\starship.toml" "%USERPROFILE%\dotfiles\starship.toml"
cmd /c mklink /d "%APPDATA%\yazi" "%USERPROFILE%\dotfiles\yazi"

cmd /c mklink /d "%APPDATA%\Zed" "%USERPROFILE%\dotfiles\zed"
```

# Remind for submodules
```sh
# pull with submodules
git pull --recurse-submodules

# if pulled without, then init submodules content in repo
git submodule update --init
```
