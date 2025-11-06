if status is-interactive
    # Commands to run in interactive sessions can go here
end

# sudo last command (not sure)
function sudo --description "Replacement for Bash 'sudo !!' command to run last command using sudo."
    if test "$argv" = !!
        echo sudo $history[1]
        eval command sudo $history[1]
    else
        command sudo $argv
    end
end

# aliases
alias l='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first'
alias ll='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -l --git -h'
alias la='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a'
alias lt "eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first --tree --level=2"
alias lla='eza --color=always --color-scale=all --color-scale-mode=gradient --icons=always --group-directories-first -a -l --git -h'

alias cfg_fish "nvim ~/.config/fish/config.fish"
alias cfg_tmux "nvim ~/.config/tmux/tmux.conf"

# main third-party packet manager
# newer nvim is also there
set -p PATH "/home/linuxbrew/.linuxbrew/bin"

# smart cd -> zoxide
zoxide init fish | source

# cool view
starship init fish | source

# on-login -> enter tmux
if not set -q TMUX
  # Check if a tmux session named 'main' exists and attach to it, otherwise create it.
  if tmux has-session -t main 2>/dev/null
    tmux attach-session -t main
  else
    tmux new-session -s main
  end
end

# fish colors
fish_config theme apply cyberdream
