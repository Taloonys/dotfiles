require("notify").setup({
    -- call :h notify.setup() to see defaults
    background_colour = "#000000", -- basicly to drop useless warning
    render = "minimal",
    top_down = false,
    fps = 60,
})

-- Основные настройки noice
require("noice").setup({
    lsp = {
        override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
        },
    },
    presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = false,
    },
    notify = {
        view = "mini",
    }
})
