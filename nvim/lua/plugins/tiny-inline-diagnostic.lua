return {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach", -- Or `LspAttach` / 'VeryLazy'
    priority = 1000,     -- needs to be loaded in first
    config = function()
        require('tiny-inline-diagnostic').setup()
        vim.diagnostic.config({ virtual_text = false })
    end
}
