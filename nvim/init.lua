-- Basics
require("settings")
require("keymap")

-- Plugin Manager
require("config.lazy")

-- Plugin-configs
require("config.telescope")
require("config.mason-lspconfig")
require("config.lsp")
require("config.lsp-autocmds")
require("config.treesitter")
require("config.colors")
require("config.toggleterm")
require("config.harpoon")
require("config.statusline")

-- I hope to refactor to:
-- require "config.lsp"
-- require "config.statusline"
-- require "config.edit"
-- require "config.parsing"
-- require "config.colors"
-- require "config.search-engines"
-- require "config.marks"
-- require "config.tabs"
-- require "config.terminals"
-- require "config.tools" -- like cmake-tools, rust-tools and etc
