-- Harpoon Configuration for Quick File Navigation
return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local harpoon = require("harpoon")
      
      -- Initialize harpoon
      harpoon:setup({})
      
      -- Key mappings for Harpoon
      local function map(mode, lhs, rhs, opts)
        local options = { noremap = true, silent = true }
        if opts then
          options = vim.tbl_extend("force", options, opts)
        end
        vim.keymap.set(mode, lhs, rhs, options)
      end
      
      -- Harpoon keybinds
      map("n", "<leader>ha", function() harpoon:list():add() end, { desc = "Harpoon add file" })
      map("n", "<leader>hh", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Harpoon quick menu" })
      
      -- Navigate to files
      map("n", "<leader>h1", function() harpoon:list():select(1) end, { desc = "Harpoon file 1" })
      map("n", "<leader>h2", function() harpoon:list():select(2) end, { desc = "Harpoon file 2" })
      map("n", "<leader>h3", function() harpoon:list():select(3) end, { desc = "Harpoon file 3" })
      map("n", "<leader>h4", function() harpoon:list():select(4) end, { desc = "Harpoon file 4" })
      
      -- Navigate between files
      map("n", "<leader>hp", function() harpoon:list():prev() end, { desc = "Harpoon previous" })
      map("n", "<leader>hn", function() harpoon:list():next() end, { desc = "Harpoon next" })
      
      -- Clear all files from harpoon
      map("n", "<leader>hc", function() harpoon:list():clear() end, { desc = "Harpoon clear all" })
    end,
  },
}
