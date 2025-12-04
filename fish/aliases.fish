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

# Open first found by zoxide dir using nvim
function viz
    if test (count $argv) -eq 0
        echo "Usage: viz <dir-name>"
        return 1
    end

    set -l target (zoxide query $argv[1] 2>/dev/null)

    if test -z "$target"
        echo "No match found for: $argv[1]"
        return 1
    end

    nvim "$target"
end

# Open fzf for desired file/dir with preview + open it in nvim
function vif
    if test (count $argv) -eq 0
        echo "Usage: vif <pattern>"
        return 1
    end

    set -l query $argv[1]

    # fzf: files + preview + patter-pre-filter
    set -l file (
        fd --type f --hidden --exclude .git | \
        fzf --query "$query" \
            --preview 'bat --style=numbers --color=always --line-range=:500 {}' \
            --height=80% \
            --border
    )

    if test -z "$file"
        return
    end

    nvim "$file"
end
