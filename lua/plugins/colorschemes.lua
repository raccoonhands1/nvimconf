return {
  -- Tokyo Night (High priority, likely default)
  {
    "folke/tokyonight.nvim",
    lazy = false,    -- Load early
    priority = 1001, -- Higher priority than others
    opts = {},       -- Add any tokyonight specific options here
  },

  -- Catppuccin
  {
    "catppuccin/nvim",
    name = "catppuccin", -- Optional: ensures folder name is predictable
    lazy = false,
    priority = 1000,
    opts = {
      -- flavour = "macchiato", -- Example: set flavor if needed (latte, frappe, macchiato, mocha)
    },
  },

  -- Gruvbox
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    opts = {}, -- Add gruvbox specific options here
  },

  -- OneDark
  {
    "navarasu/onedark.nvim",
    lazy = false,
    priority = 1000,
    opts = {}, -- Add onedark specific options here
  },

  -- Mellifluous (aliased as 'sand')
  {
    "ramojus/mellifluous.nvim",
    name = "sand", -- Use 'sand' as the plugin name for lazy.nvim management
    lazy = false,
    priority = 1001, -- High priority
    opts = {}, -- Add mellifluous specific options here
  },
}

