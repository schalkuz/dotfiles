-- Enhanced Blazor/Razor Support for C# development
return {
  -- Add file type detection for Razor/Blazor files
  {
    "AstroNvim/AstroNvim",
    opts = function(_, opts)
      -- Ensure filetypes table exists
      if not opts.filetypes then opts.filetypes = {} end
      
      -- Add Razor file types
      opts.filetypes.extension = vim.tbl_extend("force", opts.filetypes.extension or {}, {
        razor = "razor",
        cshtml = "razor",
      })
      
      return opts
    end,
  },
  
  -- Simple autocmd to set up Razor files properly
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
              -- Enable HTML-like indentation for Razor files
              vim.bo.indentexpr = "htmlindent()"
            end,
          },
        },
      },
    },
  },
}
