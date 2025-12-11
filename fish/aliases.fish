#
# sudo last command
#

function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

#
# Better ls
#

alias l 'eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first'
alias l1 'eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -1 -a'
alias lt "eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first --tree --level=2 -a"
alias ll 'eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a -l --git -h'

#
# Faster config access
#

alias rld_fish "source ~/.config/fish/config.fish"

alias cfg_fish "$EDITOR ~/.config/fish"
alias cfg_tmux "$EDITOR ~/.config/tmux"
alias cfg_nvim "$EDITOR ~/.config/nvim"

alias vi "nvim"

#
# Systemctl
#

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

#
# Docker
#

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
# Better navigation
#

# Alias for fuzzy finding files with fd and previewing with bat
alias ffp '$EDITOR (fd --type f --hidden --exclude .git | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")'

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

    $EDITOR "$target"
end


# Viz but with fzf-like preview for selecting
function vif
    if test (count $argv) -ne 2
        echo "Usage: vif <pattern> <search-root>"
        return 1
    end

    set -l query $argv[1]
    set -l root $argv[2]

    if not test -d "$root"
        echo "Search root is not a directory: $root"
        return 1
    end

    set -l file (
        fd --type f --hidden --exclude .git . "$root" | \
        fzf --query "$query" \
            --preview 'bat --style=numbers --color=always --line-range=:500 {}' \
            --height=80% \
            --border
    )

    if test -z "$file"
        return
    end

    $EDITOR "$file"
end
