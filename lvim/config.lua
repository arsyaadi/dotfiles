-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Example configs: https://github.com/LunarVim/starter.lvim
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny
--

lvim.plugins = {
  { "wakatime/vim-wakatime" },
  { "github/copilot.vim" },
  {
    "sindrets/diffview.nvim",
    event = "BufRead",
  },
  {
    "f-person/git-blame.nvim",
    event = "BufRead",
    config = function()
      vim.cmd "highlight default link gitblame SpecialComment"
      require("gitblame").setup { enabled = false }
      vim.g.gitblame_enabled = 1
    end,
  },
  {
    "zbirenbaum/copilot-cmp",
    event = "InsertEnter",
    dependencies = { "zbirenbaum/copilot.lua" },
    config = function()
      vim.defer_fn(function()
        require("copilot").setup()
        require("copilot_cmp").setup()
      end, 100)
    end,
  },
  {
    "NeogitOrg/neogit",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "sindrets/diffview.nvim",

      "nvim-telescope/telescope.nvim",
      "ibhagwan/fzf-lua",
      "echasnovski/mini.pick",
    },
    config = true
  },
  "HiPhish/rainbow-delimiters.nvim",
  config = function()
    -- This module contains a number of default definitions
    local rainbow_delimiters = require 'rainbow-delimiters'

    ---@type rainbow_delimiters.config
    vim.g.rainbow_delimiters = {
      strategy = {
        [''] = rainbow_delimiters.strategy['global'],
        vim = rainbow_delimiters.strategy['local'],
      },
      query = {
        [''] = 'rainbow-delimiters',
        lua = 'rainbow-blocks',
      },
      priority = {
        [''] = 110,
        lua = 210,
      },
      highlight = {
        'RainbowDelimiterRed',
        'RainbowDelimiterYellow',
        'RainbowDelimiterBlue',
        'RainbowDelimiterOrange',
        'RainbowDelimiterGreen',
        'RainbowDelimiterViolet',
        'RainbowDelimiterCyan',
      },
    }
  end
  -- {
  --   'Exafunction/codeium.vim',
  --   event = 'BufEnter'
  -- }
}

lvim.log.level = "warn"
lvim.format_on_save = true

vim.opt.number = true
vim.opt.relativenumber = true


-- Keybinding to switch to the previous buffer
vim.api.nvim_set_keymap('n', '<leader>bp', ':bprevious<CR>', { noremap = true, silent = true })
-- Keybinding to switch to the next buffer
vim.api.nvim_set_keymap('n', '<leader>bn', ':bnext<CR>', { noremap = true, silent = true })
-- Move selected block of code up with Ctrl+k
vim.api.nvim_set_keymap('x', '<C-k>', ':move \'<-2<CR>gv=gv', { noremap = true, silent = true })
-- Move selected block of code down with Ctrl+j
vim.api.nvim_set_keymap('x', '<C-j>', ':move \'>+1<CR>gv=gv', { noremap = true, silent = true })

-- Neogit
lvim.keys.normal_mode["<leader>ng"] = ":Neogit<CR>"

lvim.builtin.lualine.style = "default" -- or "none"
lvim.keys.normal_mode["|"] = ":vsplit<CR>"
lvim.keys.normal_mode["-"] = ":split<CR>"
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.colorscheme = "wildcharm"

vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""
local cmp = require "cmp"

-- lvim.builtin.cmp.mapping["<Tab>"] = function(fallback)
--   if cmp.visible() then
--     cmp.select_next_item()
--   else
--     local copilot_keys = vim.fn["copilot#Accept"]()
--     if copilot_keys ~= "" then
--       vim.api.nvim_feedkeys(copilot_keys, "i", true)
--     else
--       fallback()
--     end
--   end
-- end
