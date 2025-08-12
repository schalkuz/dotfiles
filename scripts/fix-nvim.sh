#!/bin/bash

# Fix AstroNvim installation issues
set -e

echo "🔧 Fixing AstroNvim installation..."

# Clean everything
echo "Cleaning old installations..."
rm -rf ~/.config/nvim ~/.local/share/nvim ~/.local/state/nvim ~/.cache/nvim

# Install fresh AstroNvim
echo "Installing fresh AstroNvim..."
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git

# Create very minimal community config that works
echo "Creating minimal community configuration..."
cat > ~/.config/nvim/lua/community.lua << 'EOF'
-- Very minimal community configuration
---@type LazySpec  
return {
  "AstroNvim/astrocommunity",
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
}
EOF

# Create colorscheme config
cat > ~/.config/nvim/lua/plugins/colorscheme.lua << 'EOF'
return {
  {
    "AstroNvim/AstroNvim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
EOF

echo "✅ Basic AstroNvim setup complete!"
echo ""
echo "🎯 Next steps:"
echo "1. Run 'nvim' and let it install plugins"
echo "2. After successful installation, we can add language packs gradually"
echo "3. Use ':q' to quit nvim after installation completes"
