local lspconfig = require "lspconfig"

lspconfig.lua_ls.setup({})
lspconfig.rust_analyzer.setup({})
lspconfig.clangd.setup({})
lspconfig.gopls.setup({})
lspconfig.pyright.setup({})

vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
vim.keymap.set('n', 'gd', vim.lsp.buf.declaration, {})
vim.keymap.set('n', 'gD', vim.lsp.buf.definition, {})
vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, {})
vim.keymap.set({'n', 'v'}, '<leader>ca', vim.lsp.buf.code_action, {})
