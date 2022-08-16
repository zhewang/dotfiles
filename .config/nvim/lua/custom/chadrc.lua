local M = {}

local pluginConfs = require "custom.plugins.configs"

M.ui = {
  theme = "onedark",
}

M.plugins = {
  user = require "custom.plugins",

  override = {
    ["nvim-treesitter/nvim-treesitter"] = pluginConfs.treesitter,
    ["kyazdani42/nvim-tree.lua"] = pluginConfs.nvimtree,
    ["folke/which-key.nvim"] = pluginConfs.which_key,
  },

  remove = {
    "goolord/alpha-nvim"
  }
}

M.mappings = require "custom.mappings"

return M
