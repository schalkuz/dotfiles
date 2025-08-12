#!/bin/bash

# Dotfiles Update Script
# Updates the dotfiles repository and reinstalls scripts/config

set -e

DOTFILES_DIR="$HOME/.dotfiles"
CYAN='\033[0;36m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${CYAN}🔄 Updating Dotfiles...${NC}"

if [ ! -d "$DOTFILES_DIR" ]; then
    echo "❌ Dotfiles directory not found at $DOTFILES_DIR"
    echo "Run the installer first: curl -sSL https://raw.githubusercontent.com/schalkuz/dotfiles/main/install.sh | bash"
    exit 1
fi

cd "$DOTFILES_DIR"

echo "📥 Pulling latest changes..."
git pull origin main

echo "🔧 Updating scripts..."
cp bin/* "$HOME/.local/bin/"
chmod +x "$HOME/.local/bin/"*

echo "⚙️ Updating shell configuration..."
if [ -f "$HOME/.zprofile" ]; then
    cp "$HOME/.zprofile" "$HOME/.zprofile.backup.$(date +%Y%m%d_%H%M%S)"
fi
cp config/zprofile "$HOME/.zprofile"

echo -e "${GREEN}✅ Dotfiles updated successfully!${NC}"
echo "🔄 Restart your terminal or run: source ~/.zprofile"
