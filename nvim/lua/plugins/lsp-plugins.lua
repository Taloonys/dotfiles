return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			"folke/lazydev.nvim",
			ft = "lua", -- only load on lua files
			opts = {
				library = {
					{ path = "${3rd}/luv/library", words = { "vim%.uv" } },
				},
			},
		},
	},
	{
		"mason-org/mason-lspconfig.nvim",
		opts = {
			-- prb required nodejs & npm
			ensure_installed = {
				"lua_ls",
				"pyright",
				"rust_analyzer",
				"clangd",
				"cmake",
				"marksman",
				"lemminx",
				"dockerls",
			},
			automatic_enable = false,
		},
		dependencies = {
			{ "mason-org/mason.nvim", opts = {} },
		},
	},
	{
		"WhoIsSethDaniel/mason-tool-installer.nvim",
		dependencies = {
			"mason-org/mason.nvim",
		},
		opts = {
			ensure_installed = {
				-- formatters
				"gofumpt",
				"prettier",
				"black",
				"rustfmt",
				"clang-format",
				"stylua",
				-- linters
				"pylint",
				"cpplint",
				"eslint_d",
				"cpplint",
				"cmakelint",
				"hadolint",
				"bacon",
			},
			automatic_installation = true,
		},
	},
}
