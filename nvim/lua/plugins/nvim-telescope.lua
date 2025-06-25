return {
	'nvim-telescope/telescope.nvim', tag = '0.1.8',
	cmd = "Telescope",
	dependencies = {
	{ "nvim-lua/plenary.nvim" },
	{
	  "polirritmico/telescope-lazy-plugins.nvim",
	  keys = {
		{ "<leader>cp", "<Cmd>Telescope lazy_plugins<CR>", desc = "Telescope: Plugins configurations" },
	  },
	},
	},
	opts = {
	extensions = {
	  ---@module "telescope._extensions.lazy_plugins"
	  ---@type TelescopeLazyPluginsUserConfig
	  lazy_plugins = {
		lazy_config = vim.fn.stdpath("config") .. "/lua/lazy/init.lua", -- Must be a valid path to the file containing the lazy spec and setup() call.
	  },
	},
		-- etc.
	},
}
