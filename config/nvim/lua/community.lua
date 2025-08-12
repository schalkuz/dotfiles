-- AstroNvim Community Pack Configurations
-- Comprehensive language and productivity support

---@type LazySpec
return {
  "AstroNvim/astrocommunity",
  
  -- === LANGUAGE PACKS ===
  -- TypeScript/React/JavaScript
  { import = "astrocommunity.pack.typescript" },
  { import = "astrocommunity.pack.typescript-deno" },
  
  -- Python
  { import = "astrocommunity.pack.python-ruff" },
  
  -- Go
  { import = "astrocommunity.pack.go" },
  
  -- C/C++
  { import = "astrocommunity.pack.cpp" },
  
  -- .NET/C#
  { import = "astrocommunity.pack.cs" },
  
  -- Web Development
  { import = "astrocommunity.pack.html-css" },
  { import = "astrocommunity.pack.tailwindcss" },
  
  -- Data & Config
  { import = "astrocommunity.pack.json" },
  { import = "astrocommunity.pack.yaml" },
  { import = "astrocommunity.pack.toml" },
  
  -- DevOps
  { import = "astrocommunity.pack.docker" },
  
  -- Documentation
  { import = "astrocommunity.pack.markdown" },
  
  -- Lua (for Neovim config)
  { import = "astrocommunity.pack.lua" },
  
  -- === COLORSCHEME ===
  { import = "astrocommunity.colorscheme.tokyonight-nvim" },
  
  -- === PRODUCTIVITY & NAVIGATION ===
  -- File navigation and search
  { import = "astrocommunity.motion.harpoon" },
  { import = "astrocommunity.motion.leap-nvim" },
  { import = "astrocommunity.motion.flash-nvim" },
  
  -- Enhanced editing
  { import = "astrocommunity.editing-support.todo-comments-nvim" },
  { import = "astrocommunity.editing-support.ultimate-autopair-nvim" },
  { import = "astrocommunity.editing-support.auto-save-nvim" },
  
  -- Git integration
  { import = "astrocommunity.git.diffview-nvim" },
  { import = "astrocommunity.git.blame-nvim" },
  
  -- File explorer
  { import = "astrocommunity.file-explorer.oil-nvim" },
  
  -- Terminal integration
  { import = "astrocommunity.terminal-integration.toggleterm-manager-nvim" },
  
  -- Testing
  { import = "astrocommunity.test.neotest" },
  
  -- Debugging
  { import = "astrocommunity.debugging.nvim-dap-virtual-text" },
  
  -- Code completion and AI
  { import = "astrocommunity.completion.copilot-lua" },
  
  -- UI improvements
  { import = "astrocommunity.utility.noice-nvim" },
  { import = "astrocommunity.scrolling.neoscroll-nvim" },
  
  -- Code runners
  { import = "astrocommunity.code-runner.sniprun" },
}
