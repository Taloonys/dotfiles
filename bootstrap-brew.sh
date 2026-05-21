#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="${HOME}/dotfiles"

CONFIG_TARGETS=(
    "${HOME}/.config/fish"
    "${HOME}/.config/nvim"
    "${HOME}/.config/tmux"
    "${HOME}/.config/yazi"
    "${HOME}/.config/starship.toml"
    "${HOME}/.gitconfig"
)

BASE_PACKAGES=(
    eza
    fd
    bat
    ripgrep
    fzf
    unzip
    go
    rust
    python
    node
    zip

    lazydocker
    lazygit

    neovim
    fish
    tmux
    yazi
)

OPTIONAL_PACKAGES=()

info() {
    printf "\n[INFO] %s\n" "$1"
}

warn() {
    printf "\n[WARN] %s\n" "$1"
}

fail() {
    printf "\n[ERR ] %s\n" "$1"
    exit 1
}

EXISTING_TARGETS=()
CONFLICT_ACTION=""

#
# Decisions
#

detect_conflicts() {
    for path in "${CONFIG_TARGETS[@]}"; do
        if [ -e "$path" ] || [ -L "$path" ]; then
            EXISTING_TARGETS+=("$path")
        fi
    done

    [ ${#EXISTING_TARGETS[@]} -eq 0 ] && return

    echo
    echo "Existing configs detected:"
    echo

    for path in "${EXISTING_TARGETS[@]}"; do
        echo "  - $path"
    done

    echo
    echo "[B] Backup existing configs"
    echo "[D] Delete existing configs"
    echo "[S] Stop installation"
    echo

    read -rp "Choose action [B/d/s]: " answer

    case "$answer" in
        ""|b|B)
            CONFLICT_ACTION="backup"
            ;;
        d|D)
            CONFLICT_ACTION="delete"
            ;;
        s|S)
            echo "Installation aborted."
            exit 0
            ;;
        *)
            fail "Invalid option."
            ;;
    esac
}

handle_existing_configs() {
    [ ${#EXISTING_TARGETS[@]} -eq 0 ] && return

    local timestamp
    timestamp="$(date +%Y%m%d-%H%M%S)"

    for path in "${EXISTING_TARGETS[@]}"; do
        case "$CONFLICT_ACTION" in
            backup)
                mv "$path" "${path}.backup.${timestamp}"
                echo "Backed up: $path"
                ;;
            delete)
                rm -rf "$path"
                echo "Deleted: $path"
                ;;
        esac
    done
}

confirm_install() {
    echo
    echo "The following packages will be installed:"
    echo

    for pkg in "${BASE_PACKAGES[@]}"; do
        echo "  - $pkg"
    done

    if [ ${#OPTIONAL_PACKAGES[@]} -gt 0 ]; then
        echo
        echo "Optional packages:"
        for pkg in "${OPTIONAL_PACKAGES[@]}"; do
            echo "  - $pkg"
        done
    fi

    echo
    read -rp "Press ENTER to continue or Ctrl+C to abort..."
}

require_brew() {
    if ! command -v brew >/dev/null 2>&1; then
        fail "Homebrew is not installed.
Install it first: https://brew.sh/"
    fi
}

ask_graphviz() {
    printf "\nInstall graphviz for PlantUML preview? [y/N]: "
    read -r answer

    case "$answer" in
        y|Y|yes|YES)
            OPTIONAL_PACKAGES+=(graphviz)
            ;;
    esac
}

install_packages() {
    info "Installing packages..."

    for pkg in "${BASE_PACKAGES[@]}"; do
        brew list "$pkg" >/dev/null 2>&1 || brew install "$pkg"
    done

    if [ ${#OPTIONAL_PACKAGES[@]} -gt 0 ]; then
        brew install "${OPTIONAL_PACKAGES[@]}"
    fi
}

setup_fish_env() {
    info "Creating env.fish..."

    touch "${DOTFILES_DIR}/fish/env.fish"
}

create_symlink() {
    local src="$1"
    local dst="$2"

    if [ -e "$dst" ] || [ -L "$dst" ]; then
        fail "Refusing to overwrite existing path: $dst"
    fi

    ln -sv "$src" "$dst"
}

setup_links() {
    info "Creating symlinks..."

    mkdir -p "${HOME}/.config"

    create_symlink \
        "${DOTFILES_DIR}/fish" \
        "${HOME}/.config/fish"

    create_symlink \
        "${DOTFILES_DIR}/nvim" \
        "${HOME}/.config/nvim"

    create_symlink \
        "${DOTFILES_DIR}/tmux" \
        "${HOME}/.config/tmux"

    create_symlink \
        "${DOTFILES_DIR}/yazi" \
        "${HOME}/.config/yazi"

    create_symlink \
        "${DOTFILES_DIR}/starship.toml" \
        "${HOME}/.config/starship.toml"
}

setup_gitconfig() {
    if [ ! -f "${HOME}/.gitconfig" ]; then
        info "Creating ~/.gitconfig from template..."

        cp "${DOTFILES_DIR}/.gitconfig.in" \
           "${HOME}/.gitconfig"

        warn "Fill your git credentials in ~/.gitconfig"
    fi
}

install_tpm() {
    if [ ! -d "${HOME}/.tmux/plugins/tpm" ]; then
        info "Installing tmux TPM..."

        git clone \
            https://github.com/tmux-plugins/tpm \
            "${HOME}/.tmux/plugins/tpm"
    fi
}

# +-----------+
# | Main flow |
# +-----------+

main() {
    require_brew

    ask_graphviz

    detect_conflicts

    confirm_install

    handle_existing_configs

    install_packages

    setup_fish_env

    setup_links

    setup_gitconfig

    install_tpm

    info "[Done]"
    info "- Now you have to manually edit ~/.gitconfig"
    info "- Run tmux and press <leader>I to install tmux plugins."
    info "- Fill place-dependent shell aliases and etc inside fish/env.fish. It should keep his gitignorance*"
}

main "$@"
