-- Tokyo Night Theme Configuration
return {
  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = {
      style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
      light_style = "day", -- The theme is used when the background is set to light
      transparent = false, -- Enable this to disable setting the background color
      terminal_colors = true, -- Configure the colors used when opening a `:terminal` in Neovim
      styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = true },
        keywords = { italic = true },
        functions = {},
        variables = {},
        -- Background styles. Can be "dark", "transparent" or "normal"
        sidebars = "dark", -- style for sidebars, see below
        floats = "dark", -- style for floating windows
      },
      sidebars = { "qf", "help", "neo-tree", "terminal" }, -- Set a darker background on sidebar-like windows
      day_brightness = 0.3, -- Adjusts the brightness of the colors of the **Day** style
      hide_inactive_statusline = false, -- Enabling this option, will hide inactive statuslines and replace them with a thin border instead
      dim_inactive = false, -- dims inactive windows
      lualine_bold = false, -- When `true`, section headers in the lualine theme will be bold
      
      -- You can override specific color groups to use other groups or a hex color
      -- function will be called with a ColorScheme table
      on_colors = function(colors) end,
      
      -- You can override specific highlights to use other groups or a hex color
      -- function will be called with a Highlights and ColorScheme table
      on_highlights = function(highlights, colors)
        -- Make line numbers more subtle
        highlights.LineNr = { fg = colors.dark5 }
        highlights.CursorLineNr = { fg = colors.orange }
      end,
    },
  },
  -- Set colorscheme
  {
    "AstroNvim/AstroNvim",
    opts = {
      colorscheme = "tokyonight-night",
    },
  },
}
