-- lazy.nvim
return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        "rcarriga/nvim-notify",
    },
    opts = {
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
            lsp_doc_border = true,
        },
        config = function()
            vim.api.nvim_set_hl(0, "TelescopeNormal", { link = "FloatBorder" })
            vim.api.nvim_set_hl(0, "TelescopeBorder", { link = "FloatBorder" })
            vim.api.nvim_set_hl(0, "TelescopePromptNormal", { link = "FloatBorder" })
        end
    },
}
