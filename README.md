# Quickstart
```sh
git clone https://github.com/Taloonys/better-dotfiles.git ~/dotfiles && cd ~/dotfiles
ln -s ~/dotfiles/nvim ~/.config/nvim
ln -s ~/dotfiles/.gitconfig ~/.gitconfig
```
* .. and open nvim, it will install plugins

---

# nvim
* currently in progress of switching to nvim as main IDE everywhere
* also i used to write helpful stuff for me and random seekers... so you are welcome

## Prb required
* fzf

## todo
* lsp
* autocompletion
* mason
* deploying *docker & wsl2* based environment

## how it works...
* `init.lua` - starting point
  * `lua/` - all `requires '<...>'` search that `...` inside `lua/` dir
* `config/` - for lazy nvim config (just `<C-c> + <C-v>` from docs) & concrete plugins configurations (`<C-..>` = Ctrl + ..)
* `plugins/` - contains plugin imports via lazy (usually bare `<C-c> + <C-v>` from git pages under *Installation*.. their dependencies are inside this files)

# gitconfig
* change username, email and editor

---

# dev notes
## Required
* **brew** + install neovim from there
* `brew install rust go unzip`
