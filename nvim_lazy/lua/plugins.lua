local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local plugins = {
	-- Packer
	-- {"wbthomason/packer.nvim"}

	-- Common utilities
	{ "nvim-lua/plenary.nvim" },

	-- Icons
	{ "nvim-tree/nvim-web-devicons" },

	-- Colorschema
	{ "rebelot/kanagawa.nvim" },

	-- Statusline
	{
		"nvim-lualine/lualine.nvim",
		event = "BufEnter",
		config = function()
			require("configs.lualine")
		end,
		dependencies = { "nvim-web-devicons" },
	},

	-- Bufferline
	{
		"akinsho/bufferline.nvim",
		--tag = "v3.*",
		config = function()
			require("configs.bufferline")
		end,
		dependencies = "nvim-tree/nvim-web-devicons",
	},

	-- Treesitter
	{
		"nvim-treesitter/nvim-treesitter",
		build = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
		config = function()
			require("configs.treesitter")
		end,
	},

	-- Mason: Portable package manager
	{
		"williamboman/mason.nvim",
		config = function()
			require("mason").setup()
		end,
	},

	-- Mason-lspconfig
	{
		"williamboman/mason-lspconfig.nvim",
		config = function()
			require("configs.mason-lsp")
		end,
		--after = "mason.nvim",
	},

	-- LSP
	{
		"neovim/nvim-lspconfig",
		config = function()
			require("configs.lspconfig")
		end,
	},

	-- Lspsaga
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		config = function()
			require("configs.lspsaga")
		end,
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			{ "nvim-treesitter/nvim-treesitter" },
		},
	},

	-- lspkind
	{ "onsails/lspkind-nvim" },

	--Snip engine
	{
		"L3MON4D3/LuaSnip",
		-- follow latest release.
		version = "<CurrentMajor>.*",
		-- install jsregexp (optional!).
		build = "make install_jsregexp",
	},

	-- Nvim-tree: File manager
	{
		"nvim-tree/nvim-tree.lua",
		dependencies = {
			"nvim-tree/nvim-web-devicons", -- optional, for file icons
		},
		tag = "nightly",
		config = function()
			require("configs.nvim-tree")
		end,
	},

	-- Show colors
	{
		"norcalli/nvim-colorizer.lua",
		config = function()
			require("colorizer").setup({ "*" })
		end,
	},

	-- Toggleterm: Terminal
	{
		"akinsho/toggleterm.nvim",
		version = "*",
		config = function()
			require("configs.toggleterm")
		end,
	},

	-- Git
	{
		"lewis6991/gitsigns.nvim",
		config = function()
			require("configs.gitsigns")
		end,
	},

	-- autopairs
	{
		"windwp/nvim-autopairs",
		config = function()
			require("configs.autopairs")
		end,
	},

	-- Background Transparent
	{
		"xiyaowong/nvim-transparent",
		config = function()
			require("configs.transparent")
		end,
	},

	-- myword
	{ "dwrdx/mywords.nvim" },

	-- telescope
	{
		"nvim-telescope/telescope.nvim",
		tag = "0.1.1",
		config = function()
			require("configs.telescope")
		end,
		dependencies = {
			"nvim-lua/plenary.nvim",
		},
	},

	-- numToStr/Comment.nvim
	{
		"numToStr/Comment.nvim",
		config = function()
			require("configs.comment")
		end,
	},

	--Neoformat
	{ "sbdchd/neoformat" },
	{
		"mhartington/formatter.nvim",
		config = function()
			require("configs.formatter")
		end,
	},

	-- fidget
	{
		"j-hui/fidget.nvim",
		config = function()
			require("fidget").setup()
		end,
	},

	-- cmp: Autocomplete
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		config = function()
			require("configs.cmp")
		end,
	},
	{ "hrsh7th/cmp-nvim-lsp" },
	-- { "hrsh7th/cmp-path", after = "nvim-cmp" },
	-- { "hrsh7th/cmp-buffer", after = "nvim-cmp" },

	-- LSP diagnostics, code actions, and more via Lua.
	{
		"jose-elias-alvarez/null-ls.nvim",
		config = function()
			require("configs.null-ls")
		end,
		dependencies = { "nvim-lua/plenary.nvim" },
	},
}

local opts = {}

require("lazy").setup(plugins, opts)
