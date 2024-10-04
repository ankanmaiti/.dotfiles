#!/bin/bash

# Define the path to your dotfiles
DOTFILES="$HOME/.dotfiles"

symlink() {
    local target="$1"
    local link_name="$2"

    # Generate a readable timestamp
    local timestamp=$(date +"date_%Y_%m_%d_time_%H_%M_%S")
    local backup_suffix="_backup_$timestamp"

    if [ -L "$link_name" ]; then
        # If the link exists, check if it points to the same target
        local old_target=$(readlink -f "$link_name")  # Use -f to resolve the absolute path
        if [ "$old_target" = "$target" ]; then
            # echo "Symlink already points to the target: $link_name -> $target"
            return
        fi

        # If the link exists but points to a different target, remove it
        echo "Replacing symlink: $link_name -> $old_target"
        rm "$link_name"

    elif [ -e "$link_name" ]; then
        # If a regular file or directory exists, back it up
        local backup_name="${link_name}${backup_suffix}"
        echo "backing up existing $link_name to $backup_name"
        mv "$link_name" "$backup_name"
    fi

    # Create the new symlink
    ln -s "$target" "$link_name"
    echo "Created symlink: $link_name -> $target"
}

# Create symlinks based on the OS
# WARNING: proper way to write link_name
#   dont : $HOME/.config/
#   do   : $HOME/.config/link_name
case "$(uname)" in
    Linux)
        symlink "$DOTFILES/bash/.bashrc"           "$HOME/.bashrc"
        symlink "$DOTFILES/tmux/.tmux.conf"        "$HOME/.tmux.conf"
        symlink "$DOTFILES/kitty"                  "$HOME/.config/kitty"
        symlink "$DOTFILES/starship/starship.toml" "$HOME/.config/starship.toml"
        symlink "$DOTFILES/nvim"                   "$HOME/.config/nvim"
        symlink "$DOTFILES/bat"                    "$HOME/.config/bat"
        symlink "$DOTFILES/yazi"                   "$HOME/.config/yazi"
        symlink "$DOTFILES/htop"                   "$HOME/.config/htop"
        symlink "$DOTFILES/i3"                     "$HOME/.config/i3"
        symlink "$DOTFILES/polybar"                "$HOME/.config/polybar"
        symlink "$DOTFILES/picom"                  "$HOME/.config/picom"
        symlink "$DOTFILES/rofi"                  "$HOME/.config/rofi"
        ;;
    *)
        echo "Unsupported OS for symlinks!"
        echo "configuration lives here :"
        echo "$DOTFILES/bash/symlinks.sh"
        ;;
esac

