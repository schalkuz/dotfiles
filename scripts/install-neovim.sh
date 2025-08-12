#!/bin/bash

# Install Neovim and AstroNvim Configuration
# This script installs Neovim, required dependencies, and sets up AstroNvim

set -e

CYAN='\033[0;36m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m'

echo -e "${CYAN}🚀 Installing Neovim Development Environment...${NC}"
echo ""

# Install Neovim and dependencies
echo -e "${CYAN}📦 Installing Neovim and dependencies...${NC}"
if command -v brew >/dev/null 2>&1; then
    # Install core tools
    brew install neovim ripgrep fd
    
    # Install JetBrains Mono Nerd Font if not already installed
    if ! ls ~/Library/Fonts/JetBrainsMono*.ttf >/dev/null 2>&1; then
        echo "📝 Installing JetBrains Mono Nerd Font..."
        brew install --cask font-jetbrains-mono-nerd-font
    else
        echo "✅ JetBrains Mono Nerd Font already installed"
    fi
else
    echo -e "${YELLOW}⚠️  Homebrew not found. Please install Homebrew first.${NC}"
    exit 1
fi

# Create backup of existing config if it exists
if [ -d "$HOME/.config/nvim" ]; then
    echo -e "${YELLOW}📋 Backing up existing Neovim config...${NC}"
    mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
fi

# Install our custom AstroNvim configuration
echo -e "${CYAN}⚙️  Installing AstroNvim configuration...${NC}"
mkdir -p "$HOME/.config"
cp -r config/nvim "$HOME/.config/"

# Install language servers and tools
echo -e "${CYAN}🔧 Installing language servers and development tools...${NC}"

# Install Node.js tools (for TypeScript/React development)
if command -v npm >/dev/null 2>&1; then
    echo "Installing TypeScript language server..."
    npm install -g typescript typescript-language-server
    
    echo "Installing React/JSX tools..."
    npm install -g @styled/typescript-styled-plugin
    npm install -g eslint prettier
fi

# Install Python tools
if command -v pip3 >/dev/null 2>&1; then
    echo "Installing Python language server..."
    pip3 install --user python-lsp-server[all]
    pip3 install --user black isort
fi

# Install additional formatters
if command -v cargo >/dev/null 2>&1; then
    echo "Installing Rust-based formatters..."
    cargo install stylua # Lua formatter
fi

# Install Go tools if Go is available
if command -v go >/dev/null 2>&1; then
    echo "Installing Go language server..."
    go install golang.org/x/tools/gopls@latest
    go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
fi

# Install .NET tools if .NET is available
if command -v dotnet >/dev/null 2>&1; then
    echo "Installing .NET language servers..."
    # OmniSharp will be installed automatically by Mason in AstroNvim
    echo ".NET support will be configured automatically by AstroNvim"
fi

echo ""
echo -e "${GREEN}✅ Neovim installation complete!${NC}"
echo ""
echo -e "${CYAN}🎯 Next steps:${NC}"
echo "1. Set your terminal font to 'JetBrains Mono Nerd Font'"
echo "2. Run 'nvim' to start Neovim - AstroNvim will install plugins automatically"
echo "3. Wait for all plugins and language servers to install"
echo "4. Restart Neovim after installation is complete"
echo ""
echo -e "${CYAN}📚 Key bindings to remember:${NC}"
echo "  <Space>ff      - Find files (Telescope)"
echo "  <Space>fg      - Live grep (search in files)"
echo "  <Space>fb      - Browse buffers"
echo "  <Space>ha      - Add file to Harpoon"
echo "  <Space>hh      - Toggle Harpoon menu"
echo "  <Space>h1-4    - Navigate to Harpoon files"
echo "  <Space>e       - Toggle file explorer"
echo "  <Space>gg      - Open Lazygit"
echo "  <Space>t       - Open terminal"
echo ""
echo -e "${YELLOW}💡 Remember to configure your terminal:${NC}"
echo "  Font: JetBrains Mono Nerd Font"
echo "  Size: 14-16pt recommended"
echo "  Theme: Tokyo Night Dark (matches Neovim)"
