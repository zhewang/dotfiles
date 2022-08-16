-- custom/plugins/configs.lua file

local M = {}

M.treesitter = {
   ensure_installed = {
      "lua",
      "python",
   },

   -- Automatically install missing parsers when entering buffer
   auto_install = true,
}

M.nvimtree = {
  view = {
    hide_root_folder = false,
  },
  git = {
    enable = true,
  },
  renderer = {
    highlight_git = true,
    icons = {
      show = {
        file = true,
        folder = true,
        folder_arrow = true,
        git = true,
      },
    },
  }
}

M.which_key = {
  disable = false,
}

return M
