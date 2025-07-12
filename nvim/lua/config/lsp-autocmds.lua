vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(event)
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

        -- ╔═══════════════════════╗
        -- ║    Auto-completion    ║
        -- ╚═══════════════════════╝
        if client:supports_method('textDocument/completion') then
            -- show menu even for 1 option, don't select first option, open options in a bit different popup menu
            vim.opt_local.completeopt = { 'menuone', 'noselect', 'noinsert', 'popup' }
            vim.lsp.completion.enable(true, client.id, event.buf, {
                -- auto show options
                autotrigger = true,
            })
        end

        -- ╔════════════════════════════════════╗
        -- ║    Auto-format ("lint") on save    ║
        -- ╚════════════════════════════════════╝
        if not client:supports_method('textDocument/willSaveWaitUntil')
            and client:supports_method('textDocument/formatting') then
            vim.api.nvim_create_autocmd('BufWritePre', {
                group = vim.api.nvim_create_augroup('my.lsp', { clear = false }),
                buffer = event.buf,

                callback = function()
                    vim.lsp.buf.format({ bufnr = event.buf, id = client.id, timeout_ms = 1000 })
                end,
            })
        end

        -- ╔══════════════╗
        -- ║    Keymaps   ║
        -- ╚══════════════╝
        local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = event.buf, desc = "LSP: " .. desc })
        end

        map("gl", vim.diagnostic.open_float, "Open Diagnostic Float")
        map("K", vim.lsp.buf.hover, "Hover Documentation")
        map("gs", vim.lsp.buf.signature_help, "Signature Documentation")
        map("gd", vim.lsp.buf.definition, "Goto Definition")
        map("gD", vim.lsp.buf.declaration, "Goto Declaration")
        map("<leader>lr", vim.lsp.buf.rename, "Rename all references")
        map("<leader>lf", vim.lsp.buf.format, "Format")
        map("<leader>v", "<cmd>vsplit | lua vim.lsp.buf.definition()<cr>", "Goto Definition in Vertical Split")

        local tiny_code_action = require "tiny-code-action"
        vim.keymap.set({ "n", "x" }, "<leader>ca", tiny_code_action.code_action(), { noremap = true, silent = true })

        -- ╔═════════════╗
        -- ║    Hints    ║
        -- ╚═════════════╝
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())

        -- ╔══════════════════╗
        -- ║    Highlights    ║
        -- ╚══════════════════╝
        -- When cursor stops moving: Highlights all instances of the symbol under the cursor
        -- When cursor moves: Clears the highlighting
        vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.document_highlight,
        })
        vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
            buffer = event.buf,
            group = highlight_augroup,
            callback = vim.lsp.buf.clear_references,
        })

        -- ╔═════════════════════╗
        -- ║    Miscellaneous    ║
        -- ╚═════════════════════╝
        -- When LSP detaches: Clears the highlighting
        vim.api.nvim_create_autocmd('LspDetach', {
            group = vim.api.nvim_create_augroup('lsp-detach', { clear = true }),
            callback = function(in_detach_event)
                vim.lsp.buf.clear_references()
                vim.api.nvim_clear_autocmds { group = 'lsp-highlight', buffer = in_detach_event.buf }
            end,
        })
    end,
})
