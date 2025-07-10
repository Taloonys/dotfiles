-- Basics
require("settings")
require("keymap")

-- Plugin Manager
require("config.lazy")

-- Config domains
require("config.parsers")
require("config.terminal")
require("config.searching")
require("config.file-jumping")

require("config.colors")
require("config.statusline")

require("config.messages")
require("config.colors")
require("config.file-explorer")
require("config.jobs-management")
require("config.animations")


require("config.lsp")
require("config.lsp-autocmds")
require("config.lsp-auto-installer")

-- C++ specific
require("config.cpp-landscape.cmake")

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
