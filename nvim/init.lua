-- Basics
require("settings")
require("keymap")

-- Plugin Manager
require("config.lazy")

-- [[ Plugins
-- * Mason -> for better lsp-stuff installing experience
-- * lspmason -> for mason-lsp bridge
-- * blink -> for auto completion
-- * treesitter -> better text parsing
-- * telescope -> as insane tool for find any files or inside them
-- * harpoon -> for faster bookmarks
-- * commentary -> for fast comments via `gcc`
-- * surround -> for fast quotas, brackets, tags & etc.
-- * lazygit -> git'ty stuff
-- * toggleterm -> as fast floating terminal, imho cli-tabs are better
-- * tabby -> for better tabs UI
-- * dashborad -> for a bit better entry menu UI
-- * sttusline -> statusline UI
-- * rose-pine -> colorsheme
-- * glow -> as simplified mini markdown-previewer
-- ]]

-- Plugin-configs
require("config.telescope")
require("config.mason-lspconfig")
require("config.lspconfig")
require("config.treesitter")
require("config.colors")
require("config.toggleterm")
require("config.harpoon")
