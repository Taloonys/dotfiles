-- vim.lsp.enable({
--     "lua_ls",
--     "clangd",
--     "rust_analyzer",
--     "gopls",
--     "cmake-language-server",
-- })

vim.lsp.config('*', {
    capabilities = {
        textDocument = {
            semanticTokens = {
                multilineTokenSupport = true,
            }
        }
    },
})

-- vim.diagnostic.config({
-- 	virtual_lines = true,
-- 	current_line = true,
-- 	underline = true,
-- 	update_in_insert = false,
-- 	severity_sort = true,
-- 	float = {
-- 		border = "rounded",
-- 		source = true,
-- 	},
-- })
