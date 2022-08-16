local M = {}

M.general = {
  n = {
    ["<C-c>"] = { "<ESC>", "ESC" },
  },
}

M.gitsigns = {

  n = {
     ["]c"] = { "<cmd> Gitsigns next_hunk<CR>", "Next hunk" },
     ["[c"] = { "<cmd> Gitsigns prev_hunk<CR>", "Previous hunk" },
  },

}

M.easymotion = {
  n = {
    ["s"] = { "<Plug>(easymotion-overwin-f2)", "Move to s{char}{char}"},
  }
}

M.trouble = {
  n = {
    ["tb"] = {"<cmd> TroubleToggle document_diagnostics<CR>", "TroubleToggle document"},
  }
}

return M
