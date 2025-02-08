#!/bin/bash

# Define the new dotfiles path
DOTFILES="$PWD"

# Array of files to link
declare -a FILES=(
    ".gitconfig:git/.gitconfig"
    ".gitconfig-personal:git/.gitconfig-personal"
    ".gitconfig-work:git/.gitconfig-work"
    ".tmux.conf:tmux/.tmux.conf"
    ".tmux.conf.local:tmux/.tmux.conf.local"
    ".vim:vim/.vim"
    ".vimrc:vim/.vimrc"
    ".zshrc:zsh/.zshrc"
	"Library/Application Support/Code/User/settings.json:vscode/settings.json"
	"Library/Application Support/Cursor/User/settings.json:cursor/settings.json"
	".config/gcloud/configurations:gcloud/configurations"
)

# Create symlinks
for file in "${FILES[@]}"; do
    # Split into source and target
    IFS=":" read -r target source <<< "$file"

    # Remove existing symlink
    rm -f "$HOME/$target"

    # Create new symlink
    ln -s "$DOTFILES/$source" "$HOME/$target"

    echo "Created symlink: $HOME/$target -> $DOTFILES/$source"
done

echo "All symlinks updated!"

