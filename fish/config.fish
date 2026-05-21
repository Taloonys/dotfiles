if status is-interactive
    # Commands to run in interactive sessions can go here
end

# main third-party packet manager
# newer nvim is also there
set -p PATH "/home/linuxbrew/.linuxbrew/bin"

# nvim as default editor for system
set -gx EDITOR nvim

# prepared variables
source ~/.config/fish/variables.fish

#
# aliases
#

source ~/.config/fish/aliases.fish

#
# Other
#

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
fish_config theme choose cyberdream

# local user-defined Env
source ~/.config/fish/env.fish
