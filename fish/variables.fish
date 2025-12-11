set -g DEFAULT_EDITOR "nvim"

# If no global ${EDITOR} then use DEFAULT_EDITOR, i.e. nvim
if not set -q EDITOR
    set -g EDITOR $DEFAULT_EDITOR
end
