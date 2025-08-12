#!/bin/bash

# Add language packs to working AstroNvim installation
set -e

echo "🚀 Adding language packs to AstroNvim..."
echo ""
echo "⚠️  Make sure you've run 'nvim' first and let the basic installation complete!"
echo "Press Enter to continue or Ctrl+C to cancel..."
read

# Create comprehensive community config
cat > ~/.config/nvim/lua/community.lua << 'EOF'
-- Comprehensive AstroNvim Community Configuration
---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  
  -- === LANGUAGE PACKS ===
  -- TypeScript/JavaScript/React
  { import = "astrocommunity.pack.typescript-all-in-one" },
  
  -- Python with Ruff
  { import = "astrocommunity.pack.python-ruff" },
  
  -- Go
  { import = "astrocommunity.pack.go" },
  
  -- C/C++
  { import = "astrocommunity.pack.cpp" },
  
  -- C# with OmniSharp
  { import = "astrocommunity.pack.cs-omnisharp" },
  
  -- Web Development
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  
  -- Data formats
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  
  -- Lua
  { import = "astrocommunity.pack.lua" },
  
  -- === THEME ===
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  
  -- === PRODUCTIVITY ===
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.utility.noice-nvim" },
}
EOF

# Add Blazor support
cat > ~/.config/nvim/lua/plugins/blazor-support.lua << 'EOF'
return {
  {
    "AstroNvim/AstroCore",
    opts = {
      autocmds = {
        razor_setup = {
          {
            event = { "BufRead", "BufNewFile" },
            pattern = { "*.razor", "*.cshtml" },
            callback = function()
              vim.bo.filetype = "razor"
            end,
          },
        },
      },
    },
  },
}
EOF

echo "✅ Language packs added!"
echo ""
echo "🎯 Next steps:"
echo "1. Run 'nvim' again"
echo "2. Let AstroNvim install the new language pack plugins"
echo "3. Language servers will be installed automatically via Mason"
echo ""
echo "📚 Your languages are now supported:"
echo "  • TypeScript/JavaScript/React"
echo "  • Python with Ruff"
echo "  • Go with gopls"
echo "  • C/C++ with clangd"
echo "  • C#/.NET with OmniSharp (includes Blazor/Razor)"
echo "  • HTML/CSS and Tailwind CSS"
echo "  • JSON, YAML, Lua"
