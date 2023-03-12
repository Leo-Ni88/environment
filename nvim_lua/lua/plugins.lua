-- automatically install and set up packer.nvim
local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
        vim.notify("Cloning Pakcer.nvim, waitting...")
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.notify("Installing Pakcer.nvim ...")
        vim.cmd [[packadd packer.nvim]]
        vim.notify("Pakcer.nvim installed finished")
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Use a protected call so we don't error out on first 
local status_ok, packer = pcall(require, "packer")
if not status_ok then
    vim.notify("packer not installed")
    return
end

-- Automatically run: PackerCompile
vim.api.nvim_create_autocmd("BufWritePost", {
	group = vim.api.nvim_create_augroup("PACKER", { clear = true }),
	pattern = "plugins.lua",
	command = "source <afile> | PackerCompile",
})

packer.startup({
    function()
	    -- Packer
        use({"wbthomason/packer.nvim"})

	    -- Common utilities
	    use({"nvim-lua/plenary.nvim"})

	    -- Icons
	    use({"nvim-tree/nvim-web-devicons"})

	    -- Colorschema
	    use({"rebelot/kanagawa.nvim"})

	    -- Statusline
	    use({
	    	"nvim-lualine/lualine.nvim",
	    	event = "BufEnter",
	    	config = function()
	    		require("configs.lualine")
	    	end,
	    	requires = { "nvim-web-devicons" },
	    })

        -- Bufferline
        use({
            'akinsho/bufferline.nvim',
            tag = "v3.*",
	    	config = function()
	    		require("configs.bufferline")
	    	end,
            requires = 'nvim-tree/nvim-web-devicons'
        })

	    -- Treesitter
	    use({
	    	"nvim-treesitter/nvim-treesitter",
	    	run = function()
	    		require("nvim-treesitter.install").update({ with_sync = true })
	    	end,
	    	config = function()
	    		require("configs.treesitter")
	    	end,
	    })

	    -- Mason: Portable package manager
	    use({
	    	"williamboman/mason.nvim",
	    	config = function()
	    		require("mason").setup()
	    	end,
	    })

        -- Mason-lspconfig
	    use({
	    	"williamboman/mason-lspconfig.nvim",
	    	config = function()
	    		require("configs.mason-lsp")
	    	end,
	    	after = "mason.nvim",
	    })

	    -- LSP
	    use({
	    	"neovim/nvim-lspconfig",
	    	config = function()
	    		require("configs.lspconfig")
	    	end,
	    })

        -- Lspsaga
        use({
            "glepnir/lspsaga.nvim",
            branch = "main",
            config = function()
                require("configs.lspsaga")
            end,
            requires = {
                {"nvim-tree/nvim-web-devicons"},
                {"nvim-treesitter/nvim-treesitter"}
            },
            opts = {
                window = {
                    blend = 0,
                }
            },
        })

        -- lspkind
	    use({"onsails/lspkind-nvim"})

        --Snip engine
	    use({
	    	"L3MON4D3/LuaSnip",
	    	tag = "v<CurrentMajor>.*",
	    })

	    -- Nvim-tree: File manager
        use {
            'nvim-tree/nvim-tree.lua',
            requires = {
              'nvim-tree/nvim-web-devicons', -- optional, for file icons
            },
            tag = 'nightly',
	    	config = function()
	    		require("configs.nvim-tree")
	    	end,
        }

	    -- Show colors
	    use({
	    	"norcalli/nvim-colorizer.lua",
	    	config = function()
	    		require("colorizer").setup({ "*" })
	    	end,
	    })

	    -- Toggleterm: Terminal
	    use({
	    	"akinsho/toggleterm.nvim",
	    	tag = "*",
	    	config = function()
	    		require("configs.toggleterm")
	    	end,
	    })

	    -- Git
	    use({
	    	"lewis6991/gitsigns.nvim",
	    	config = function()
	    		require("configs.gitsigns")
	    	end,
	    })

	    -- autopairs
	    use({
	    	"windwp/nvim-autopairs",
	    	config = function()
	    		require("configs.autopairs")
	    	end,
	    })

	    -- Background Transparent
	    use({
	    	"xiyaowong/nvim-transparent",
	    	config = function()
	    		require("configs.transparent")
	    	end,
	    })

        -- myword
	    use({"dwrdx/mywords.nvim"})

        -- telescope
        use({
            'nvim-telescope/telescope.nvim',
            tag = '0.1.1',
	    	config = function()
	    		require("configs.telescope")
	    	end,
            requires = {
                {'nvim-lua/plenary.nvim'}
            }
        })

        -- numToStr/Comment.nvim
        use({
            'numToStr/Comment.nvim',
            config = function()
                require('configs.comment')
            end
        })

        --Neoformat
        use({ 'sbdchd/neoformat' })
        use({
            'mhartington/formatter.nvim',
            configs = function()
                require("configs.formatter")
            end,
        })

        -- fidget
	    use({
	    	"j-hui/fidget.nvim",
	    	config = function()
	    		require("fidget").setup()
	    	end,
	    })

        -- cmp: Autocomplete
        use({
            "hrsh7th/nvim-cmp",
            event = "InsertEnter",
            config = function()
                require("configs.cmp")
            end,
        })
        use("hrsh7th/cmp-nvim-lsp")
        use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
        use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })

        -- LSP diagnostics, code actions, and more via Lua.
	    use({
	    	"jose-elias-alvarez/null-ls.nvim",
	    	config = function()
	    		require("configs.null-ls")
	    	end,
	    	requires = { "nvim-lua/plenary.nvim" },
	    })

        -- Automatically set up your configuration after cloning packer.nvim
        if packer_bootstrap then
            require('packer').sync()
        end
    end,

    config = {
       display = {
            open_fn = function()
                return require("packer.util").float({border = "rounded"})
            end,
      },
    }
})

