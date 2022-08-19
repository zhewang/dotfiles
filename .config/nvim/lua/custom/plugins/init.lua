return {
  ["rmagatti/auto-session"] = {
    config = function()
      require('auto-session').setup {
        log_level = 'info',
        auto_session_suppress_dirs = {'~/', '~/Projects'}
      }
    end
  },

  ["easymotion/vim-easymotion"] = {},

  ["christoomey/vim-tmux-navigator"] = {},

  ["folke/trouble.nvim"] = {
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup {}
    end,
  },

  ["neovim/nvim-lspconfig"] = {
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.plugins.lspconfig"
    end,
  },

  ["folke/which-key.nvim"] = {
    disable = false,
  },

  ["chipsenkbeil/distant.nvim"] = {
    config = function ()
      require('distant').setup {
        ['*'] = require('distant.settings').chip_default()
      }
    end
  },

}
