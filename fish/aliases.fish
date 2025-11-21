#
# aliases
#

alias l 'eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first'
alias l1 'eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -1'
alias lt "eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first --tree --level=2"
alias lla 'eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a -l --git -h'

# Alias for fuzzy finding files with fd and previewing with bat
alias ffp 'fd --type f --hidden --exclude .git | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}"'

alias rld_fish "source ~/.config/fish/config.fish"

alias cfg_fish "nvim ~/.config/fish"
alias cfg_tmux "nvim ~/.config/tmux"
alias cfg_nvim "nvim ~/.config/nvim"

alias vi "nvim"

# Systemctl
alias sc 'systemctl'
alias scs 'sudo systemctl start'
alias sce 'sudo systemctl enable'
alias scd 'sudo systemctl disable'
alias scr 'sudo systemctl restart'
alias scst 'systemctl status'
alias scj 'journalctl -u'
alias scdr 'sudo systemctl daemon-reload'

function sclogs
    if test (count $argv) -lt 1
        echo "Usage: sclogs <service-name>"
        return 1
    end
    sudo journalctl -u $argv[1] -n 50 --no-pager
end

# Docker
alias d 'docker'
alias dps 'docker ps'
alias dpa 'docker ps -a'
alias di 'docker images'
alias dlogs 'docker logs -f'
alias dex 'docker exec -it'
alias dstop 'docker stop $(docker ps -a -q)'
alias drm 'docker rm $(docker ps -a -q)'
alias drmf 'docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dclean 'docker container prune -f'
alias dcleanall 'docker system prune -f'
alias dri 'docker rmi $(docker images -q)'
alias dbuild 'docker build -t'

function dex
    if test (count $argv) -lt 1
        echo "Usage: dex <container_name> [shell]"
        echo "Example: dex my_container bash"
        return 1
    end

    set container $argv[1]
    set shell "sh"

    if test (count $argv) -ge 2
        set shell $argv[2]
    end

    docker exec -it $container $shell
end

# Docker Compose
alias dcu 'docker compose up'
alias dcud 'docker compose up -d'
alias dcd 'docker compose down'
alias dcb 'docker compose build'
alias dclogs 'docker compose logs -f'

#
# !!! highly experimental by ChatGPT =) !!!
#

# --- colorful bat ---
function v
    if test (count $argv) -eq 0
        echo "Usage: v <filename>"
        return 1
    end
    bat --paging=always --style=plain --color=always $argv
end

# fzf to nvim
function ff
    set file (fd --type f --hidden --exclude .git | fzf \
        --height=80% --border \
        --preview 'bat --color=always --style=numbers --line-range=:300 {}' \
        --preview-window=right:70%)
    if test -n "$file"
        nvim $file
    end
end

# search + jump to path -> ???
function fcd
    set dir (fd --type d --hidden --exclude .git | fzf --height=80% --border)
    if test -n "$dir"
        cd $dir
    end
end

# search file + open preview -> ???
function fshow
    set file (fd --type f --hidden --exclude .git | fzf \
        --preview 'bat --color=always --style=numbers --line-range=:200 {}' \
        --preview-window=right:70%)
    if test -n "$file"
        bat --paging=always --style=numbers $file
    end
end

# fast log check by fzf
function flog
    set file (fd --type f --hidden --exclude .git -e log | fzf \
        --preview 'tail -n 100 {}' --preview-window=down:60%)
    if test -n "$file"
        echo "📜 Tail: $file"
        tail -f $file
    end
end

# rg + fzf
function fgrep
    if test (count $argv) -eq 0
        echo "Usage: fgrep <pattern>"
        return 1
    end
    rg --color=always --line-number --no-heading --hidden --smart-case $argv | \
    fzf --ansi --preview 'bat --style=numbers --color=always --highlight-line {2} {1}' \
        --delimiter ':' --nth 3.. \
        --bind 'enter:execute(nvim {1} +{2})'
end

alias ffv='ff'      # Find & open file (vim)
alias fcd='fcd'     # Find & cd
alias fshow='fshow' # Find & show
alias flog='flog'   # Tail logs
alias fgrep='fgrep' # Search in files

alias t100='tail -n 100'
alias tf='tail -f'

# + zoxide

# zoxide + fzf
function fz
    set dir (zoxide query -l | fzf --height=80% --border --prompt="📁 Jump to: ")
    if test -n "$dir"
        cd $dir
    end
end

# find file in zoxide-searched-project
function fzf_in_zoxide
    set dir (zoxide query -l | fzf --height=80% --border --prompt="📂 Choose project: ")
    if test -n "$dir"
        cd $dir
        echo "📍 Entered: $dir"
        set file (fd --type f --hidden --exclude .git | fzf \
            --preview 'bat --color=always --style=numbers --line-range=:300 {}' \
            --preview-window=right:70%)
        if test -n "$file"
            nvim $file
        end
    end
end

# open project through zoxide in nvim
function fp
    set dir (zoxide query -l | fzf --height=80% --border --prompt="📂 Select project: ")
    if test -n "$dir"
        echo "🧭 Opening project: $dir"
        cd $dir
        nvim .
    end
end

# fzf open project & after -> open file inside
function fzfproj
    fzf_in_zoxide
end

alias fz='fz'
alias fp='fp'
alias fzfproj='fzfproj'
