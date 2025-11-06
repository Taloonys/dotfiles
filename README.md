# Features
* Wezterm -> optionally
* Starship -> also optionally
* nvim is clear -> doesn't require any C-compiler

# Quickstart
> There is a high chance that you have to swap '~' with your actual 'C:/Users/<name>' -> do only absolute ways
```sh
git clone https://github.com/Taloonys/dotfiles.git ~/dotfiles && cd ~/dotfiles
cp ./gitconfig.in ~/.gitconfig # + change your info
```
* From admin (newer versions on windows can sudo)
```sh
cmd /c mklink /d C:\Users\<<user>>\AppData\local\nvim <<path-to-dotfiles>>\nvim
cmd /c mklink /d C:\Users\<<user>>\.config\wezterm <<path-to-dotfiles>>\wezterm
sudo cmd /c mklink C:\Users\<<user>>\.config\starship.toml <<path-to-dotfiles>>\starship.toml
```

# Remind for submodules
```sh
# pull with submodules
git pull --recurse-submodules

# if pulled without, then init submodules content in repo
git submodule update --init
```
