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

- **BE AWARE** - scripts would delete current configs for according tools
  - and `~/.gitconfig`\*

- use one of presented scripts
  - `bootstrap-brew.sh` - basic install through brew
  - `bootstrap-brew-bundle.sh` - TODO - as script above but with `brew bundle`
  - OR do `brew bundle` (works for `BrewFile`) - TODO - brew manifest, but some must do on your own
- _(Optional)_ for plantuml preview it also require `graphviz`, but it... prb you wouldn't even care

> fzf must be heavily above v0.60 otherwise sth won't work inside yazi. `brew` usually has on of the newest versions

- **while in terminal with tmux -> press `<leader>i`**, currently for tmux it's `Space+Ctrl`

- ~~suffer~~ enjoy

## BTW

> It's already in scripts, but commands inside for softlinks are:

```sh
rm -rf ~/.config/fish && ln -svf ~/dotfiles/fish ~/.config/fish
rm -rf ~/.config/nvim && ln -svf ~/dotfiles/nvim ~/.config/nvim
rm -rf ~/.config/tmux && ln -svf ~/dotfiles/tmux ~/.config/tmux
rm -rf ~/.config/yazi && ln -svf ~/dotfiles/yazi ~/.config/yazi
rm -rf ~/.config/tmux && ln -svf ~/dotfiles/starship.toml ~/.config/starship.toml
```

## Gitconfig

- copy template for gitconfig + fill ur credentails

```sh
cp ~/dotfiles/.gitconfig.in ~/.gitconfig
# !!! and change there ur info <-> cuz it's pure template
```

# Remind for submodules

```sh
# pull with submodules
git pull --recurse-submodules

# if pulled without, then init submodules content in repo
git submodule update --init
```
