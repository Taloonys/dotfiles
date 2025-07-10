vim.lsp.enable({
	"clangd",
	"rust_analyzer",
})

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
