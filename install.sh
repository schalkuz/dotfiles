#!/bin/bash

# Schalk's Dotfiles Installer
# Quick setup for macOS development environment
# Usage: curl -sSL https://raw.githubusercontent.com/schalkuz/dotfiles/main/install.sh | bash

set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

# Emojis for better output
CHECK="✅"
CROSS="❌"
INFO="ℹ️"
ROCKET="🚀"
WRENCH="🔧"
FOLDER="📁"

print_header() {
    echo ""
    echo -e "${PURPLE}================================================${NC}"
    echo -e "${PURPLE}🚀 Schalk's Dotfiles Installation${NC}"
    echo -e "${PURPLE}================================================${NC}"
    echo ""
    echo -e "${CYAN}This will install:${NC}"
    echo -e "${CYAN}• Homebrew package manager${NC}"
    echo -e "${CYAN}• Development tools (Python UV, Node NVM, Go GVM)${NC}"
    echo -e "${CYAN}• GitHub CLI with multi-profile support${NC}"
    echo -e "${CYAN}• Custom scripts and aliases${NC}"
    echo -e "${CYAN}• Directory structure for projects${NC}"
    echo ""
}

log_info() {
    echo -e "${BLUE}${INFO} $1${NC}"
}

log_success() {
    echo -e "${GREEN}${CHECK} $1${NC}"
}

log_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

log_error() {
    echo -e "${RED}${CROSS} $1${NC}"
}

log_section() {
    echo ""
    echo -e "${PURPLE}${WRENCH} $1${NC}"
    echo -e "${PURPLE}================================================${NC}"
}

check_os() {
    if [[ "$OSTYPE" != "darwin"* ]]; then
        log_error "This script is designed for macOS only."
        exit 1
    fi
    log_success "macOS detected"
}

install_xcode_tools() {
    log_section "Installing Xcode Command Line Tools"
    
    if xcode-select -p >/dev/null 2>&1; then
        log_success "Xcode Command Line Tools already installed"
    else
        log_info "Installing Xcode Command Line Tools..."
        xcode-select --install
        log_success "Xcode Command Line Tools installed"
    fi
}

install_homebrew() {
    log_section "Installing Homebrew"
    
    if command -v brew >/dev/null 2>&1; then
        log_success "Homebrew already installed"
    else
        log_info "Installing Homebrew..."
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        
        # Add Homebrew to PATH for this session
        echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
        eval "$(/opt/homebrew/bin/brew shellenv)"
        
        log_success "Homebrew installed and configured"
    fi
}

install_github_cli() {
    log_section "Installing GitHub CLI"
    
    if command -v gh >/dev/null 2>&1; then
        log_success "GitHub CLI already installed"
    else
        log_info "Installing GitHub CLI..."
        brew install gh
        log_success "GitHub CLI installed"
    fi
}

clone_dotfiles() {
    log_section "Cloning Dotfiles Repository"
    
    DOTFILES_DIR="$HOME/.dotfiles"
    
    if [ -d "$DOTFILES_DIR" ]; then
        log_info "Dotfiles directory already exists, pulling latest changes..."
        cd "$DOTFILES_DIR"
        git pull
    else
        log_info "Cloning dotfiles repository..."
        git clone https://github.com/schalkuz/dotfiles.git "$DOTFILES_DIR"
        cd "$DOTFILES_DIR"
    fi
    
    log_success "Dotfiles repository ready"
}

setup_directories() {
    log_section "Setting Up Directory Structure"
    
    mkdir -p "$HOME/Code/work"
    mkdir -p "$HOME/Code/personal"
    mkdir -p "$HOME/.local/bin"
    
    log_success "Project directories created"
}

install_scripts() {
    log_section "Installing Custom Scripts"
    
    # Copy all custom scripts to ~/.local/bin
    cp bin/* "$HOME/.local/bin/"
    chmod +x "$HOME/.local/bin/"*
    
    log_success "Custom scripts installed"
}

install_shell_config() {
    log_section "Installing Shell Configuration"
    
    # Backup existing .zprofile if it exists
    if [ -f "$HOME/.zprofile" ]; then
        log_info "Backing up existing .zprofile..."
        cp "$HOME/.zprofile" "$HOME/.zprofile.backup.$(date +%Y%m%d_%H%M%S)"
    fi
    
    # Install our .zprofile
    cp config/zprofile "$HOME/.zprofile"
    
    log_success "Shell configuration installed"
}

install_development_tools() {
    log_section "Installing Development Tools"
    
    # Install UV for Python
    log_info "Installing UV (Python package manager)..."
    curl -LsSf https://astral.sh/uv/install.sh | sh
    
    # Install NVM for Node.js
    log_info "Installing NVM (Node.js version manager)..."
    curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
    
    # Install GVM for Go
    log_info "Installing GVM (Go version manager)..."
    bash < <(curl -s -S -L https://raw.githubusercontent.com/moovweb/gvm/master/binscripts/gvm-installer)
    
    # Install essential build tools
    log_info "Installing build tools..."
    brew install cmake pkg-config
    
    log_success "Development tools installed"
}

install_default_versions() {
    log_section "Installing Default Language Versions"
    
    # Source the shell configuration to load version managers
    source "$HOME/.zprofile"
    
    # Install Python 3.12
    log_info "Installing Python 3.12..."
    if command -v uv >/dev/null 2>&1; then
        uv python install 3.12
    fi
    
    # Install Node.js LTS
    log_info "Installing Node.js LTS..."
    if command -v nvm >/dev/null 2>&1; then
        nvm install --lts
    fi
    
    # Install Go
    log_info "Installing Go 1.23.4..."
    if command -v gvm >/dev/null 2>&1; then
        gvm install go1.23.4 -B
        gvm use go1.23.4 --default
    fi
    
    log_success "Default language versions installed"
}

setup_git_config() {
    log_section "Setting Up Git Configuration"
    
    echo ""
    echo -e "${CYAN}Git configuration setup:${NC}"
    echo "The git-profile command will handle email configuration per repository."
    echo "Please set your name for git commits:"
    echo ""
    
    read -p "Enter your full name for Git: " git_name
    git config --global user.name "$git_name"
    
    log_success "Git configured with name: $git_name"
    log_info "Use 'git-profile work' or 'git-profile personal' to set email per repo"
}

print_completion() {
    echo ""
    echo -e "${GREEN}================================================${NC}"
    echo -e "${GREEN}🎉 Installation Complete!${NC}"
    echo -e "${GREEN}================================================${NC}"
    echo ""
    echo -e "${CYAN}Next steps:${NC}"
    echo -e "${CYAN}1. Restart your terminal or run: source ~/.zprofile${NC}"
    echo -e "${CYAN}2. Authenticate with GitHub: gh auth login${NC}"
    echo -e "${CYAN}3. Run 'dev' to see all available commands${NC}"
    echo -e "${CYAN}4. Run 'devenv status' to check development tools${NC}"
    echo ""
    echo -e "${YELLOW}Useful commands:${NC}"
    echo -e "${YELLOW}• dev                    - Development cheat sheet${NC}"
    echo -e "${YELLOW}• devenv                - Development environment manager${NC}"  
    echo -e "${YELLOW}• git-profile personal  - Switch to personal GitHub profile${NC}"
    echo -e "${YELLOW}• git-profile work      - Switch to work GitHub profile${NC}"
    echo -e "${YELLOW}• cdpersonal           - Go to personal projects${NC}"
    echo -e "${YELLOW}• cdwork               - Go to work projects${NC}"
    echo ""
    echo -e "${PURPLE}Happy coding! 🚀${NC}"
}

main() {
    print_header
    
    # Check if user wants to continue
    read -p "Continue with installation? (y/N): " -n 1 -r
    echo
    if [[ ! $REPLY =~ ^[Yy]$ ]]; then
        echo "Installation cancelled."
        exit 1
    fi
    
    check_os
    install_xcode_tools
    install_homebrew
    install_github_cli
    clone_dotfiles
    setup_directories
    install_scripts
    install_shell_config
    install_development_tools
    install_default_versions
    setup_git_config
    print_completion
}

# Run main function
main "$@"
