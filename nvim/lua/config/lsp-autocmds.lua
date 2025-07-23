--[[
--Basicly, i use formatting from builtin stuff
--]]

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('my.lsp', {}),
    callback = function(event)
        local client = assert(vim.lsp.get_client_by_id(event.data.client_id))

        -- ╔═══════════════════════════╗
        -- ║    Auto-format on save    ║
        -- ╚═══════════════════════════╝
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

        -- ╔═════════════╗
        -- ║    Hints    ║
        -- ╚═════════════╝
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end,
})
