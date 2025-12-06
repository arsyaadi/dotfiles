-- ===============
-- Basis Settings
-- ===============


vim.g.mapleader = " " --space leader
vim.g.maplocalleader = " "

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
	{"nvim-tree/nvim-tree.lua", dependencies = {"nvim-tree/nvim-web-devicons"} },
	-- fuzzy finder
	{
        "nvim-telescope/telescope.nvim",
        version = "0.1.5",
        dependencies = {"nvim-lua/plenary.nvim"} },
	
    -- Dashboard
    { 
        "goolord/alpha-nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
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
        end,    
    },


	-- LSP
	{ "williamboman/mason.nvim" },

	-- autocomplete
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-buffer",
	"hrsh7th/cmp-path",
	"L3MON4D3/LuaSnip",
	"saadparwaiz1/cmp_luasnip",

	-- Treesitter
	{ "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },

	-- Statusline
	{ "nvim-lualine/lualine.nvim", dependencies = { "nvim-tree/nvim-web-devicons" } },

	-- Comment
	"numToStr/Comment.nvim",

	-- Git
 	"lewis6991/gitsigns.nvim",
	
	-- Keybinding helper
	"folke/which-key.nvim",

	-- Theme
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },  
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
		icon_enable = true,
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

-- ====================
-- LSP & Autocomplete
-- ====================

require("mason").setup()
-- require("mason-lspconfig").setup({
-- 	ensure_installed = {
-- 		"lua_ls",
-- 		"tsserver",
-- 		"html",
-- 		"cssls",
-- 		"jsonls",
-- 		"gopls",
-- 		"intelephense",
-- 		"omnisharp",
-- 	},
-- 	automatic_installation = true
-- })

-- local lspconfig = require("lspconfig")

local on_attach = function(_, bufnr)
	local bufmap = function(mode, lhs, rhs, desc)
		vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc })
	end

	bufmap("n", "gd", vim.lsp.buf.definition, "Go to definition")
	bufmap("n", "gr", vim.lsp.buf.references, "Go to references")
	bufmap("n", "K", vim.lsp.buf.hover, "Hover")
	bufmap("n", "<leader>rn", vim.lsp.buf.rename, "Rename")
	bufmap("n", "<leader>ca", vim.lsp.buf.code_action, "Code action")
	bufmap("n", "[d", vim.diagnostic.goto_prev, "Prev diagnostic")
	bufmap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
end

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
		["<CR>"] = cmp.mapping.confirm({ select = true }),
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

