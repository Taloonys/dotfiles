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

alias rld-fish "source ~/.config/fish/config.fish"

alias cfg-fish "$EDITOR ~/.config/fish"
alias cfg-tmux "$EDITOR ~/.config/tmux"
alias cfg-nvim "$EDITOR ~/.config/nvim"

alias vi "nvim"
alias vih "nvim ."
alias lg "lazygit"
alias ld "lazydocker"

#
# Utility
#

alias bat-last "bat (ls -t | head -n 1)"

#
# Systemctl
#

alias sc 'systemctl'
alias scs 'sudo systemctl start'
alias sce 'sudo systemctl enable'
alias scd 'sudo systemctl disable'
alias scr 'sudo systemctl restart'
alias scstat 'systemctl status'
alias scj 'journalctl -u'
alias sc-dreload 'sudo systemctl daemon-reload'

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
alias dexec 'docker exec -it'
alias dstop 'docker stop $(docker ps -a -q)'
alias drm 'docker rm $(docker ps -a -q)'
alias drmrf 'docker stop $(docker ps -a -q) && docker rm $(docker ps -a -q)'
alias dclean 'docker container prune -f'
alias dcleanall 'docker system prune -f'
alias drmi 'docker rmi $(docker images -q)'
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
alias fzf-file '$EDITOR (fd --type f --hidden --exclude .git | fzf --preview "bat --color=always --style=numbers --line-range=:500 {}")'


function viz --description "`viz project` => enter vim for first match of zoxide (through fzf) with name `project`"
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


function vif --description "find file through fzf and open it in vim"
    if test (count $argv) -lt 1
        echo "Usage: vif <pattern> [search-root]"
        return 1
    end

    set -l query $argv[1]

    # By default cwd is used
    set -l root (pwd)

    # If search root is specified - use it
    if test (count $argv) -ge 2
        set root $argv[2]
    end

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



function fz --description "Find file and z-into his directory. Like `fd` but `find` + `z`"
    if test (count $argv) -lt 1
        echo "Usage: fzf-file-dir <file-pattern>"
        return 1
    end

    set -l query $argv[1]

    # fzf search with pattern
    set -l file (
        fd --type f --hidden --exclude .git . | \
        fzf --query "$query" \
            --preview 'bat --style=numbers --color=always --line-range=:500 {}' \
            --height=80% \
            --border
    )

    if test -z "$file"
        return
    end

    # get parent dir of file
    set -l dir (dirname "$file")

    # cd there
    z "$dir"
end


function find-dir --description "Поиск вложенных папок по полному пути и переход через zoxide"
    set -l query "$argv"

    set -l dir (
        fd --type d --full-path --hidden --follow --exclude .git | \
        fzf --query "$query" \
            --preview 'eza --tree --level=2 --color=always --icons {}' \
            --height=80% \
            --border
    )

    if test -n "$dir"
        z "$dir"
    end
end


function full-fname --description "Поиск файла и возврат его полного пути"
    set -l query "$argv"

    set -l file (
        fd --type f --full-path --hidden --follow --exclude .git | \
        fzf --query "$query" \
            --preview 'bat --style=numbers --color=always --line-range=:500 {}' \
            --height=80% \
            --border
    )

    if test -n "$file"
        realpath "$file"
    end
end



# modified yazi through `y` 
# -> when you exit it - you are dropped into last yazi folder
function y
	set tmp (mktemp -t "yazi-cwd.XXXXXX")
	command yazi $argv --cwd-file="$tmp"
	if read -z cwd < "$tmp"; and [ "$cwd" != "$PWD" ]; and test -d "$cwd"
		z -- "$cwd"
	end
	command rm -f -- "$tmp"
end
