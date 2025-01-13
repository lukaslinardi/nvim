-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
	local lazyrepo = "https://github.com/folke/lazy.nvim.git"
	local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
	if vim.v.shell_error ~= 0 then
		vim.api.nvim_echo({
			{ "Failed to clone lazy.nvim:\n", "ErrorMsg" },
			{ out, "WarningMsg" },
			{ "\nPress any key to exit..." },
		}, true, {})
		vim.fn.getchar()
		os.exit(1)
	end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Setup lazy.nvim
require("lazy").setup({
	spec = {
		{
			"nvim-telescope/telescope.nvim",
			tag = "0.1.2",
			dependencies = { { "nvim-lua/plenary.nvim" } },
			config = function()
				require("plugins.telescope")
			end,
		},
		-- use({
		-- 	"embark-theme/vim",
		-- 	as = "embark",
		-- 	config = function()
		-- 		vim.cmd("colorscheme embark")
		-- 	end,
		-- })

		-- use({
		--     "rebelot/kanagawa.nvim",
		--     as = 'kanagawa',
		--     config = function()
		--         vim.cmd('colorscheme kanagawa')
		--     end
		-- })

		-- use {
		--     'AlexvZyl/nordic.nvim',
		--     as = 'nordic',
		--     config = function()
		--         vim.cmd('colorscheme nordic')
		--     end
		-- }

		{
			"ramojus/mellifluous.nvim",
			config = function()
				vim.cmd("colorscheme mellifluous")
			end,
		},
		{
			"nvim-treesitter/nvim-treesitter",
			build = ":TSUpdate",
			config = function()
				require("plugins.treesitter")
			end,
		},
		{ "nvim-treesitter/playground" },
		{
			"theprimeagen/harpoon",
			config = function()
				require("plugins.harpoon")
			end,
		},
		{ "mbbill/undotree",
			config = function()
				require("plugins.undotree")
			end,
        },
		{
			"tpope/vim-fugitive",
			config = function()
				require("plugins.fugitive")
			end,
		},
		{
			"VonHeikemen/lsp-zero.nvim",
			branch = "v2.x",
			dependencies = {
				-- LSP Support
				{ "neovim/nvim-lspconfig" }, -- Required
				{ "williamboman/mason.nvim" }, -- Optional
				{ "williamboman/mason-lspconfig.nvim" }, -- Optional

				-- Autocompletion
				{ "hrsh7th/nvim-cmp",
                    config = function()
                        require("plugins.cmp")
                    end,
                }, -- Required
				{ "hrsh7th/cmp-buffer" }, -- Required
				{ "hrsh7th/cmp-path" }, -- Required
				{ "saadparwaiz1/cmp_luasnip" },
				{ "hrsh7th/cmp-nvim-lsp" }, -- Required
				{ "hrsh7th/cmp-nvim-lua" }, -- Required

				{ "L3MON4D3/LuaSnip" }, -- Required
				{ "rafamadriz/friendly-snippets" }, -- Required
			},
			config = function()
				require("plugins.lsp")
			end,
		},

		{ "lukas-reineke/indent-blankline.nvim",
			config = function()
				require("plugins.ibl")
			end,

        },
		{
			"folke/trouble.nvim",
			dependencies = { "nvim-tree/nvim-web-devicons" },
			config = function()
				require("plugins.trouble")
			end,
		},

		{ "mhartington/formatter.nvim" },
		{
			"stevearc/conform.nvim",
			config = function()
				require("plugins.conform")
			end,
		},
		{ "MunifTanjim/prettier.nvim" },
		{
			"nvim-lualine/lualine.nvim",
			requires = { "nvim-tree/nvim-web-devicons", opt = true },
			config = function()
				require("plugins.lualine")
			end,
		},
		--   { "powerline/powerline" },
		{
			"numToStr/Comment.nvim",
			config = function()
				require("Comment").setup()
			end,
		},
		{
			"windwp/nvim-autopairs",
			config = function()
				require("nvim-autopairs").setup({})
			end,
		},
		{
			"windwp/nvim-ts-autotag",
			config = function()
				require("nvim-ts-autotag").setup({})
			end,
		},
		{ "darrikonn/vim-gofmt" },
	},
	-- automatically check for plugin updates
	checker = { enabled = true },
})
