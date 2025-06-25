# Quickstart
```sh
git clone https://github.com/Taloonys/dotfiles.git ~/dotfiles && cd ~/dotfiles
cmd /c mklink /d ~\AppData\local\nvim ~\dotfiles\nvim
cmd /c mklink ~\.gitconfig ~\dotfiles\.gitconfig
```
* check nvim requirements
* .. and open nvim, it will install plugins

---

# nvim
* currently in progress of switching to nvim as main IDE everywhere
* also i used to write helpful stuff for me and random seekers... so you are welcome

## Prb required
* brew & install neovim 0.11+
* tbh idk

## todo
* understand / get used to:
    * buffers
    * tabs
    * macros
    * marks
* deploying *docker & wsl2* based environment
* wezterm config sync
* better refactor

## how it works...
* `init.lua` - starting point
  * `lua/` - all `requires '<...>'` search that `...` inside `lua/` dir
* `config/` - for lazy nvim config (just `<C-c> + <C-v>` from docs) & concrete plugins configurations (`<C-..>` = Ctrl + ..)
* `plugins/` - contains plugin imports via lazy (usually bare `<C-c> + <C-v>` from git pages under *Installation*.. their dependencies are inside this files)

# gitconfig
* change username, email and editor
