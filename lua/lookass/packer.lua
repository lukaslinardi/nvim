return require("packer").startup(function(use)
	use("wbthomason/packer.nvim")
	use({
		"nvim-telescope/telescope.nvim",
		tag = "0.1.2",
		-- or                            , branch = '0.1.x',
		requires = { { "nvim-lua/plenary.nvim" } },
	})

	use({
		"embark-theme/vim",
		as = "embark",
		config = function()
			vim.cmd("colorscheme embark")
		end,
	})

	-- use { "rebelot/kanagawa.nvim", as = 'kanagawa',
	--     config = function()
	--         vim.cmd('colorscheme kanagawa')
	--     end
	-- }

	-- use {
	--     'AlexvZyl/nordic.nvim',
	--     as = 'nordic',
	--     config = function()
	--         vim.cmd('colorscheme nordic')
	--     end
	-- }

	use("nvim-treesitter/nvim-treesitter", { run = ":TSUpdate" })
	use("nvim-treesitter/playground")
	use("theprimeagen/harpoon")
	use("mbbill/undotree")
	use("tpope/vim-fugitive")
	use({
		"VonHeikemen/lsp-zero.nvim",
		branch = "v2.x",
		requires = {
			-- LSP Support
			{ "neovim/nvim-lspconfig" }, -- Required
			{ "williamboman/mason.nvim" }, -- Optional
			{ "williamboman/mason-lspconfig.nvim" }, -- Optional

			-- Autocompletion
			{ "hrsh7th/nvim-cmp" }, -- Required
			{ "hrsh7th/cmp-buffer" }, -- Required
			{ "hrsh7th/cmp-path" }, -- Required
			{ "saadparwaiz1/cmp_luasnip" },
			{ "hrsh7th/cmp-nvim-lsp" }, -- Required
			{ "hrsh7th/cmp-nvim-lua" }, -- Required

			{ "L3MON4D3/LuaSnip" }, -- Required
			{ "rafamadriz/friendly-snippets" }, -- Required
		},
	})

	use({ "lukas-reineke/indent-blankline.nvim" })
	use({
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
	})

	use({
		"akinsho/toggleterm.nvim",
		tag = "*",
		config = function()
			require("toggleterm").setup()
		end,
	})

	use({ "mhartington/formatter.nvim" })
	use({ "stevearc/conform.nvim" })
	use({ "MunifTanjim/prettier.nvim" })
	use({
		"nvim-lualine/lualine.nvim",
		requires = { "nvim-tree/nvim-web-devicons", opt = true },
		config = function()
			require("lualine").setup()
		end,
	})
	use({ "powerline/powerline" })
	use({
		"numToStr/Comment.nvim",
		config = function()
			require("Comment").setup()
		end,
	})
	use({
		"windwp/nvim-autopairs",
		config = function()
			require("nvim-autopairs").setup({})
		end,
	})
	use({
		"windwp/nvim-ts-autotag",
		config = function()
			require("nvim-ts-autotag").setup({})
		end,
	})

	use({ "darrikonn/vim-gofmt" })
end)
