vim.api.nvim_create_autocmd('LspAttach', {
	group = vim.api.nvim_create_augroup('my.lsp', {}),
	callback = function(args)
		local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

		if client:supports_method('textDocument/completion') then
			vim.lsp.completion.enable(true, client.id, args.buf, { autotrigger = true })
		end

		-- Auto-format ("lint") on save.
		if not client:supports_method('textDocument/willSaveWaitUntil')
			and client:supports_method('textDocument/formatting') then
			vim.api.nvim_create_autocmd('BufWritePre', {
				group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
				buffer = args.buf,

				callback = function()
					vim.lsp.buf.format({ bufnr = args.buf, id = client.id, timeout_ms = 1000 })
				end,
			})
		end

		-- keymaps
		local map = function(keys, func, desc)
			vim.keymap.set("n", keys, func, { buffer = args.buf, desc = "LSP: " .. desc })
		end

		map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
		map("K", vim.lsp.buf.hover, "Hover Documentation")
		map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
		map("gD", vim.lsp.buf.declaration, "Goto Declaration")
		-- map("<leader>la", vim.lsp.buf.code_action, "Code Action") -- using tiny-code-actions for this
		map("<leader>lr", vim.lsp.buf.rename, "Rename all references")
		map("<leader>lf", vim.lsp.buf.format, "Format")
		map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

		-- When LSP detaches: Clears the highlighting
		vim.api.nvim_create_autocmd('LspDetach', {
			group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
			callback = function(event)
				vim.lsp.buf.clear_references()
				vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = event.buf }
			end,
		})
	end,
})
