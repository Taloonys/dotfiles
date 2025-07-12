-- `nvim-cmp` === `cmp`
require("luasnip.loaders.from_vscode").lazy_load() -- required by LuaSnip if friendly-snippes is used


local lspconfig    = require "lspconfig"
local capabilities = require("cmp_nvim_lsp").default_capabilities()
lspconfig.lua_ls.setup { capabilites = capabilities }
lspconfig.gopls.setup { capabilites = capabilities }
lspconfig.clangd.setup { capabilites = capabilities }
lspconfig.rust_analyzer.setup { capabilites = capabilities }

local cmp = require "cmp"
cmp.setup({
    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<C-e>'] = cmp.mapping.abort(),
        ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources(
        {
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
        },
        {
            { name = 'buffer' },
        },
        {
            {
                name = 'omni',
                option = { disable_omnifunc = { "v:lua.vim.lsp.omnifunc" } }
            }
        },
        {
            name = 'nvim_lsp_signature_help'
        })
})
