-- AstroNvim Community Pack Configuration
-- Using only official community packs for stability

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  
  -- === LANGUAGE PACKS ===
  -- TypeScript/JavaScript (comprehensive pack)
  { import = "astrocommunity.pack.typescript-all-in-one" },
  
  -- Python with Ruff
  { import = "astrocommunity.pack.python-ruff" },
  
  -- Go
  { import = "astrocommunity.pack.go" },
  
  -- C/C++
  { import = "astrocommunity.pack.cpp" },
  
  -- C# with OmniSharp (includes Blazor/Razor support)
  { import = "astrocommunity.pack.cs-omnisharp" },
  
  -- Web Development
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  
  -- Data formats
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  
  -- Lua (for Neovim configuration)
  { import = "astrocommunity.pack.lua" },
  
  -- === COLORSCHEME ===
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  
  -- === PRODUCTIVITY ===
  -- File navigation
  { import = "astrocommunity.motion.harpoon" },
  
  -- === EDITING ENHANCEMENTS ===
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  
  -- === GIT INTEGRATION ===
  { import = "astrocommunity.git.diffview-nvim" },
  
  -- === UI IMPROVEMENTS ===
  { import = "astrocommunity.utility.noice-nvim" },
}
