-- ╔════════════════════╗
-- ║    Snippet load    ║
-- ╚════════════════════╝
-- >>> required by LuaSnip if friendly-snippes is used
-- `nvim-cmp` === `cmp`
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = vim.fn.stdpath("config") .. "/snippets" })

-- ╔════════════════════════════╗
-- ║    Form lsp capabilites    ║
-- ╚════════════════════════════╝
-- >>> forward cmp capabilities for neovim completion to lsp's
local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.lua_ls.setup({ capabilites = capabilities })
lspconfig.pyright.setup({ capabilites = capabilities })
lspconfig.gopls.setup({ capabilites = capabilities })
lspconfig.clangd.setup({ capabilites = capabilities })
lspconfig.cmake.setup({ capabilites = capabilities })
lspconfig.rust_analyzer.setup({ capabilites = capabilities }) -- could be replaced by rustaceanvim
lspconfig.dockerls.setup({ capabilites = capabilities })

-- ╔══════════════════════════════╗
-- ║    Autocompletion sources    ║
-- ╚══════════════════════════════╝
local cmp = require("cmp")
cmp.setup({
	snippet = {
		expand = function(args)
			require("luasnip").lsp_expand(args.body) -- For `luasnip` users.
		end,
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = cmp.mapping.preset.insert({
		["<C-b>"] = cmp.mapping.scroll_docs(-4),
		["<C-f>"] = cmp.mapping.scroll_docs(4),
		["<C-Space>"] = cmp.mapping.complete(),
		-- ['<C-e>'] = cmp.mapping.abort(),
		["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
	}),
	sources = cmp.config.sources({
		{ name = "nvim_lsp" }, -- lsp completion
		{ name = "luasnip" }, -- For luasnip users.
	}, {
		{ name = "buffer" }, -- completion with words, that were used in current buffer
	}, {
		{ name = "path" }, -- system paths
	}, {
		name = "nvim_lsp_signature_help", -- show signature docs
	}),
})

cmp.setup.cmdline("/", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = "buffer" }
  }
})

cmp.setup.cmdline(":", {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = "path" }
  }, {
    { name = "cmdline" }
  })
})

-- ╔══════════════════════╗
-- ║    Better keymaps    ║
-- ╚══════════════════════╝
local map = vim.keymap.set
vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		-- See `:help vim.lsp.*` for documentation on any of the below functions
		local opts = { buffer = ev.buf, silent = true }

		opts.desc = "Show LSP references"
		map("n", "gR", "<cmd>Telescope lsp_references<CR>", opts)

		opts.desc = "Go to declaration"
		map("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP definitions"
		map("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts)

		opts.desc = "Show LSP implementations"
		map("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts)

		opts.desc = "Show LSP type definitions"
		map("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts)

		opts.desc = "Smart rename"
		map("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show buffer diagnostics"
		map("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts)

		opts.desc = "Show line diagnostics"
		map("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "Show documentation for what is under cursor"
		map("n", "K", vim.lsp.buf.hover, opts)

		opts.desc = "Restart LSP"
		map("n", "<leader>rs", ":LspRestart<CR>", opts)
	end,
})
