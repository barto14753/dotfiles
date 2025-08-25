#!/bin/bash

# Dotfiles Installation Script
# This script creates symlinks for dotfiles configuration

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Get the directory where this script is located
DOTFILES_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Function to create symlink with backup
create_symlink() {
    local source="$1"
    local target="$2"
    local backup_dir="$HOME/.dotfiles_backup"
    
    # Create backup directory if it doesn't exist
    mkdir -p "$backup_dir"
    
    # If target exists and is not a symlink to our dotfile
    if [[ -e "$target" ]] && [[ ! -L "$target" || "$(readlink "$target")" != "$source" ]]; then
        local backup_file="$backup_dir/$(basename "$target").backup.$(date +%Y%m%d_%H%M%S)"
        print_warning "Backing up existing $target to $backup_file"
        mv "$target" "$backup_file"
    fi
    
    # Remove existing symlink if it points to a different location
    if [[ -L "$target" ]] && [[ "$(readlink "$target")" != "$source" ]]; then
        rm "$target"
    fi
    
    # Create symlink if it doesn't exist
    if [[ ! -L "$target" ]]; then
        ln -s "$source" "$target"
        print_success "Created symlink: $target -> $source"
    else
        print_status "Symlink already exists: $target"
    fi
}

# Main installation function
install_dotfiles() {
    print_status "Starting dotfiles installation..."
    print_status "Dotfiles directory: $DOTFILES_DIR"
    
    # Array of dotfiles to link (format: "source:target")
    # Add more entries here as you add more dotfiles
    local dotfiles=(
        ".vimrc:$HOME/.vimrc"
        # Add more dotfiles here, for example:
        # ".bashrc:$HOME/.bashrc"
        # ".zshrc:$HOME/.zshrc"
        # ".gitconfig:$HOME/.gitconfig"
        # ".tmux.conf:$HOME/.tmux.conf"
    )
    
    # Create symlinks for each dotfile
    for dotfile in "${dotfiles[@]}"; do
        IFS=':' read -r source_file target_path <<< "$dotfile"
        local source_path="$DOTFILES_DIR/$source_file"
        
        if [[ -f "$source_path" ]]; then
            create_symlink "$source_path" "$target_path"
        else
            print_warning "Source file not found: $source_path"
        fi
    done
    
    print_success "Dotfiles installation completed!"
}

# Function to uninstall (remove symlinks)
uninstall_dotfiles() {
    print_status "Uninstalling dotfiles..."
    
    local dotfiles=(
        "$HOME/.vimrc"
        # Add more paths here as you add more dotfiles
    )
    
    for dotfile in "${dotfiles[@]}"; do
        if [[ -L "$dotfile" ]] && [[ "$(readlink "$dotfile")" == "$DOTFILES_DIR"* ]]; then
            rm "$dotfile"
            print_success "Removed symlink: $dotfile"
        fi
    done
    
    print_success "Dotfiles uninstallation completed!"
}

# Function to show status of dotfiles
status_dotfiles() {
    print_status "Dotfiles status:"
    
    local dotfiles=(
        ".vimrc"
        # Add more dotfiles here
    )
    
    for dotfile in "${dotfiles[@]}"; do
        local source_path="$DOTFILES_DIR/$dotfile"
        local target_path="$HOME/$dotfile"
        
        echo -n "  $dotfile: "
        
        if [[ -L "$target_path" ]]; then
            local link_target="$(readlink "$target_path")"
            if [[ "$link_target" == "$source_path" ]]; then
                echo -e "${GREEN}✓ Linked${NC}"
            else
                echo -e "${YELLOW}⚠ Linked to different location: $link_target${NC}"
            fi
        elif [[ -f "$target_path" ]]; then
            echo -e "${YELLOW}⚠ File exists but not linked${NC}"
        else
            echo -e "${RED}✗ Not linked${NC}"
        fi
    done
}

# Help function
show_help() {
    echo "Dotfiles Installation Script"
    echo ""
    echo "Usage: $0 [OPTION]"
    echo ""
    echo "Options:"
    echo "  install     Install dotfiles by creating symlinks (default)"
    echo "  uninstall   Remove symlinks to dotfiles"
    echo "  status      Show current status of dotfiles"
    echo "  help        Show this help message"
    echo ""
    echo "The script will:"
    echo "  - Create backups of existing files before linking"
    echo "  - Create symlinks from dotfiles repo to home directory"
    echo "  - Report any issues or conflicts"
}

# Main script logic
case "${1:-install}" in
    "install")
        install_dotfiles
        ;;
    "uninstall")
        uninstall_dotfiles
        ;;
    "status")
        status_dotfiles
        ;;
    "help"|"-h"|"--help")
        show_help
        ;;
    *)
        print_error "Unknown option: $1"
        show_help
        exit 1
        ;;
esac
