-- ===============
-- Basis Settings
-- ===============


vim.g.mapleader = " " --space leader
vim.g.maplocalleader = " "

-- disable netrw for nvim-tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

local opt = vim.opt
opt.number = true
opt.relativenumber = true
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.termguicolors = true
opt.cursorline = true
opt.signcolumn = "yes"
opt.clipboard = "unnamedplus"

opt.mouse = "a"
opt.splitright = true
opt.splitbelow = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = false
opt.updatetime = 250
opt.timeoutlen = 500

-- ===============
-- Lazy Vim
-- ===============

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- ===============
-- Plugins
-- ===============
require("lazy").setup({
    -- file explorer
    { "nvim-tree/nvim-tree.lua",          dependencies = { "nvim-tree/nvim-web-devicons" } },
    -- fuzzy finder
    {
        "nvim-telescope/telescope.nvim",
        version = "0.1.5",
        dependencies = { "nvim-lua/plenary.nvim" }
    },

    -- Dashboard
    {
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    -- LSP
    { "williamboman/mason.nvim" },
    { "williamboman/mason-lspconfig.nvim" },
    { "neovim/nvim-lspconfig" },

    -- autocomplete
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",

    -- Treesitter
    { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

    -- Formatter
    { "stevearc/conform.nvim" },

    -- Autopairs & Surround
    { "windwp/nvim-autopairs" },
    {
        "kylechui/nvim-surround",
        version = "*",
    },

    -- Statusline
    { "nvim-lualine/lualine.nvim",          dependencies = { "nvim-tree/nvim-web-devicons" } },

    -- Comment
    "numToStr/Comment.nvim",

    -- Git
    "lewis6991/gitsigns.nvim",

    -- Terminal
    {
        "akinsho/toggleterm.nvim",
        version = "*",
        config = function()
            require("toggleterm").setup()
        end
    },

    -- Indent Guide
    { "lukas-reineke/indent-blankline.nvim" },

    -- TODO Comments
    { "folke/todo-comments.nvim",           dependencies = { "nvim-lua/plenary.nvim" } },

    -- Keybinding helper
    "folke/which-key.nvim",

    -- Theme
    { "catppuccin/nvim",       name = "catppuccin", priority = 1000 },

    -- Copilot
    { "github/copilot.vim" },

    -- Wakatime
    { "wakatime/vim-wakatime", lazy = false },
})

-- =================
-- Plugin Config
-- =================

-- Theme
vim.cmd.colorscheme("catppuccin")

-- nvim-tree
require("nvim-tree").setup()
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<CR>", { desc = "Toggle File Explorer" })

-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>ff", builtin.find_files, { desc = "Find files" })
vim.keymap.set("n", "<leader>fg", builtin.live_grep, { desc = "Live grep" })
vim.keymap.set("n", "<leader>fb", builtin.buffers, { desc = "Buffers" })
vim.keymap.set("n", "<leader>fh", builtin.help_tags, { desc = "Help" })


-- lualine
require("lualine").setup({
    options = {
        theme = "auto",
        icons_enabled = true,
    },
})

-- Comment
require("Comment").setup()

-- Gitsigns
require("gitsigns").setup()

-- Which-key
require("which-key").setup()

-- Treesitter
require("nvim-treesitter.configs").setup({
    ensure_installed = {
        "lua", "javascript", "typescript", "tsx",
        "html", "css", "json", "php", "go", "c_sharp"
    },
    highlight = { enable = true },
    indent = { enable = true },
})

-- Dashboard
local alpha = require("alpha")
local dashboard = require("alpha.themes.dashboard")


dashboard.section.header.val = {
    "⠀⠀⠀⠀⠀⠀⢀⠄⠈⣀⡤⣖⣭⠳⣝⢮⢳⡭⣳⢭⣳⢭⡗⣏⠾⣱⢏⡳⣭⢳⡝⢮⣓⢯⢲⣄⡈⠐⢠⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⠀⢀⠄⣠⡰⣝⣣⡝⢶⣊⠿⣜⠮⢧⡳⢭⢶⣙⡞⡼⣍⢯⣓⢮⢳⣣⢏⡞⢧⣫⢞⣣⠟⡾⣤⠈⠈⠑⠰⢠⠀⡀⠀⠀⠀⠀⠀",
    "⠀⠀⠀⡠⢠⡚⣧⢳⢮⠕⣞⣣⠯⣝⣎⢯⣳⢭⣛⠶⣍⢾⡱⣎⠷⣎⢏⡷⢪⣝⢺⣣⢧⣛⣬⢻⣱⢫⠿⣤⠀⠢⡀⠀⠀⠘⠃⠐⠒⠂",
    "⡠⡄⢐⣔⡲⣝⣣⠯⣒⡽⢎⣣⢻⣜⡼⣫⢞⣣⢯⡝⢮⣇⢟⣜⡳⣎⢯⣜⡳⣎⠷⣱⢎⡳⣏⡶⣙⢮⣛⡼⢏⡤⡁⠄⠀⠀⠀⠀⠀⠀",
    "⣵⡩⣛⡴⣛⡴⣣⢻⡼⣜⣫⣝⠷⣝⡶⣝⠾⡜⡸⢭⡳⢎⣏⠶⡽⣜⣣⠞⡵⠎⣏⢧⢏⡳⣎⢷⡹⢞⡼⡜⢟⣫⠧⣌⠠⠀⠀⠀⠀⠀",
    "⢶⡹⣥⢳⣭⠶⣏⢷⣙⢶⡵⣫⢟⡳⡝⣎⡻⢭⢏⡳⣭⢏⡼⣭⢳⡭⢖⣯⢹⡃⠽⣎⣟⡟⣯⢞⣱⣙⡶⣝⢧⣹⢻⡜⡥⡐⢄⠀⠀⠀",
    "⢧⢟⣮⢛⣬⢻⣜⣣⢾⡫⣾⢳⣫⢳⡝⢮⣝⣣⢏⡳⡽⣎⡗⣮⢓⣾⡹⣖⡏⣖⢯⡟⣼⣹⢜⣮⢳⡭⢞⣯⢞⣥⢻⣜⢧⡝⣢⡑⢄⠀",
    "⣏⣞⠲⣏⢮⣓⢮⠵⣮⢝⣮⢳⡱⣏⢞⡳⣜⠮⣝⣳⠻⣼⡹⢖⡏⡾⣵⡿⣜⢳⣎⡻⡵⢮⣻⣬⣻⣞⣳⢮⣝⣲⢫⣝⢶⠫⣱⡚⣆⠑",
    "⡞⣜⡻⣬⢳⠭⣞⣹⢎⣯⢲⢏⡵⣎⠯⣵⢫⡝⣾⣣⢿⣣⢟⣭⣞⡼⣼⠿⡜⣧⢾⣱⣟⡿⡉⣾⣹⠨⡳⣭⣗⣣⢏⣾⢭⠀⠀⠁⠊⠹",
    "⡝⣮⢵⣣⢏⣻⣼⢫⣞⠲⣏⡞⡵⣎⢟⣲⢏⣾⣣⢿⡾⣞⢫⠗⠀⣏⡿⣏⡽⣒⣏⣶⢧⣟⠃⡳⣭⡠⢷⢣⣎⠗⡾⣼⢫⠀⠀⠀⠀⠀",
    "⣛⢶⣭⢶⣟⡿⣱⢏⡼⣛⡜⡞⡵⣎⣯⡳⢏⡾⢧⢳⣓⣞⠏⠈⢼⢳⠋⡶⣍⢷⡺⣝⡞⠎⠨⣷⣉⣓⡾⢣⡯⢯⡕⣻⣽⠀⠀⠀⠀⠀",
    "⡟⣯⠞⣯⡞⣵⢫⡞⣵⡹⢎⡽⣱⣞⢧⢏⣏⠞⢃⢧⡳⠂⠀⠀⣌⡟⠐⣱⢫⠞⣵⡻⠌⢂⣴⣿⣟⠛⢿⣧⢇⡯⣛⡭⡎⠀⠀⠀⠀⠀",
    "⡝⣎⡿⢧⣛⣶⣟⡹⡖⣭⢻⣼⣳⢯⡞⡭⡮⠁⡚⡊⠀⠀⠀⢠⡔⠀⠂⡱⣏⠿⡰⠋⠬⢾⢿⣷⣼⠀⢸⠟⣸⣻⣱⡟⡆⠀⠀⠀⠀⠀",
    "⡝⣾⣹⣳⢿⣏⢶⡹⡵⣋⣷⣞⣯⣓⢮⡝⠀⠉⠐⠀⢀⠀⠀⠔⢀⠏⠀⠱⣎⠝⠠⠂⢰⣾⣾⣿⠿⠀⠀⢠⢯⣷⢳⡝⢯⢆⠄⠀⠀⠀",
    "⣽⢷⣯⣟⡯⣎⢧⡳⣽⣻⡮⢛⠶⣩⠖⠊⠀⠐⠀⣁⣀⣤⣤⡄⠤⠀⠀⡘⠀⠆⠀⠀⠸⠍⠩⠤⠃⠀⠀⣮⣟⣮⢳⢯⣏⡞⢇⠀⠀⠀",
    "⣯⢷⣻⢮⡳⣝⢮⣷⡏⠪⢰⢏⣳⠍⠈⠀⠠⠚⠛⠋⠉⠈⠁⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠁⠂⠁⠀⠀⢰⣳⠾⡼⣩⢞⠈⢺⢭⡀⠀⠀",
    "⣯⢿⣭⢳⣝⣮⣿⢯⡿⣆⡾⣸⢃⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡼⡜⠉⢸⡱⢞⠀⠀⢪⡇⠀⠀",
    "⣝⣯⣼⡿⣽⢯⣟⡿⣽⢣⡿⠝⠫⠈⢢⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢃⠀⠀⠁⠑⠯⠀⠀⠀⠀⠀⠀",
    "⣎⡿⡾⣽⡟⣿⠼⠝⠃⠋⠁⠀⢠⡐⢉⢂⠐⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠔⠀⠀⠀⠀⠀⢈⠀⠈⠐⠠⠀⠈⡀⠀⠀⠀⠀⠀",
    "⡾⠝⠛⠁⠁⠀⠀⠀⠀⠀⠀⠀⠘⡀⡁⠤⠀⠀⠀⠐⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠆⠁⠀⠀⠄⠊⠀⠀⠁⠀⡀⠀⠀⠀⠃⠀⠀⠀⠀⠀",
    "⠟⠯⠿⢳⢆⣄⠀⠀⠀⠀⠀⠀⠀⠊⠀⠀⡠⠉⠁⠢⠠⠀⠁⠂⠄⡀⠀⠀⠀⠀⠀⠄⠈⠄⢄⠀⠀⠀⡀⠀⠀⠀⢀⠄⠀⠀⠀⠀⠀⠀",
    "⠒⡖⡀⠀⠈⠺⠥⣆⡀⠀⠀⢀⠁⠀⠀⡐⠀⠀⢀⠁⠀⠰⠀⢐⠀⠝⠊⢁⠀⠈⠀⠀⠐⠉⠪⢅⠀⠀⠀⠀⢠⠖⡝⠀⠀⠀⠀⠀⠀⠀",
    "⠀⠀⢀⠀⠈⠢⡀⠑⠶⣀⠀⠈⠀⠀⠈⠀⠀⠀⡄⠀⠀⡀⠀⢀⠈⠄⠘⠀⠄⠀⠀⠈⠀⠀⠀⠀⡀⠄⢂⠤⡅⣸⠆⠀⠀⠀⠀⠀⠀⠀",
    "⠠⠀⠸⠀⠀⠀⠈⠂⠀⠳⣳⡄⠂⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠄⠄⠠⠁⠃⠀⠀⣰⠡⢠⠂⠈⠀⠀⢊⠀⡄⠰⢙⠃⠀⠀⠀⠀⠀⠀⠀",
    "⠀⡀⠈⠀⠀⠀⠀⠀⠀⠀⠈⠫⢿⣦⣐⠀⠀⡀⠀⠀⠀⠀⠀⠀⢰⢆⢄⠀⠈⢰⢛⠄⣚⣀⡀⠀⠀⠀⠠⡠⠁⠈⠀⠀⠀⠀⠀⠀⠀⠀",
}

dashboard.section.buttons.val = {
    dashboard.button("f", "󰈞 Find File", ":Telescope find_files<CR>"),
    dashboard.button("n", " New File", ":ene <BAR> startinsert<CR>"),
    dashboard.button("p", " Projects", ":Telescope find_files<CR>"),
    dashboard.button("r", " Recent", ":Telescope oldfiles<CR>"),
    dashboard.button("t", "󰊄 Find Text", ":Telescope live_grep<CR>"),
    dashboard.button("c", " Config", ":e $MYVIMRC<CR>"),
    dashboard.button("q", " Quit", ":qa<CR>"),
}


dashboard.section.footer.val = "Ikuyo Kita"

alpha.setup(dashboard.config)

-- Copilot
vim.g.copilot_no_tab_map = true
vim.g.copilot_assume_mapped = true
vim.g.copilot_tab_fallback = ""

vim.keymap.set("i", "<C-l>", "copilot#Accept('<CR>')", {
    silent = true,
    expr = true,
    replace_keycodes = false,
    desc = "Accept Copilot Suggestion",
})


-- ====================
-- LSP & Autocomplete
-- ====================

require("mason").setup()

local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
    "lua_ls",
    "ts_ls",
    "html",
    "cssls",
    "jsonls",
    "intelephense",
    "gopls",
    "omnisharp",
}

-- local on_attach = function(_, bufnr)
--     local bufmap = function(mode, lhs, rhs, desc)
--         vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
--     end
--
--     bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
--     bufmap("n", "gr", vim.lsp.buf.references, "Go to references")
--     bufmap("n", "K", vim.lsp.buf.hover, "Hover")
--     bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
--     bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
--     bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
--     bufmap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
-- end

require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

vim.api.nvim_create_autocmd("LspAttach", {
    callback = function(ev)
        local buf = ev.buf

        local bufmap = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = buf, desc = desc })
        end

        bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
        bufmap("n", "gr", vim.lsp.buf.references, "Go to references")
        bufmap("n", "K", vim.lsp.buf.hover, "Hover")
        bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
        bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
        bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
        bufmap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
    end,
})

vim.lsp.config("*", {
    capabilities = capabilities,
})

vim.lsp.enable(servers)

-- nvim-cmp
local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end,
    },
    mapping = cmp.mapping.preset.insert({
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-space>"] = cmp.mapping.complete(),
        ["<CR>"] = cmp.mapping(function(fallback)
            if cmp.visible() and cmp.get_active_entry() then
                cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true })
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            else
                fallback()
            end
        end, { "i", "s" }),
        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
    sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" },
    }, {
        { name = "buffer" },
        { name = "path" },
    }),
})

-- Autopairs
local autopairs = require("nvim-autopairs")
autopairs.setup({})
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

-- Surround
require("nvim-surround").setup({})

-- Formating
require("conform").setup({
    formatters_by_ft = {
        lua = { "stylua" },
        typescript = { "prettier" },
        tsx = { "prettier" },
        javascript = { "prettier" },
        html = { "prettier" },
        css = { "prettier" },
        json = { "prettier" },
        php = { "phpcsfixer" },
        go = { "gofmt" },
        c_sharp = { "csharpier" },
    },
    format_on_save = {
        lsp_fallback = true,
        timeout_ms = 1000,
    },
})

vim.keymap.set("n", "<leader>f", function()
    require("conform").format({ async = true, lsp_fallback = true })
end, { desc = "Format file" })

-- Terminal
require("toggleterm").setup({})
vim.keymap.set("n", "<leader>tt", ":toggleterm<CR>", { desc = "Toggle Terminal" })

-- TODO Comments
require("todo-comments").setup({})
vim.keymap.set("n", "]t", function()
    require("todo-comments").jump_next()
end, { desc = "Next TODO comment" })
vim.keymap.set("n", "[t", function()
    require("todo-comments").jump_prev()
end, { desc = "Prev TODO comment" })

-- ================
-- Keybindings
-- ================

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

vim.keymap.set("x", "I", function()
    vim.cmd("normal! I")
end, { silent = true })

vim.keymap.set("x", "A", function()
    vim.cmd("normal! A")
end, { silent = true })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Save file" })
vim.keymap.set("n", "<leader>q", ":q<CR>", { desc = "Quit window" })
vim.keymap.set("n", "<leader>h", ":nohlsearch<CR>", { desc = "Clear search highlight" })
