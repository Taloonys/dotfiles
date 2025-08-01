return {
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "folke/lazydev.nvim",
            ft = "lua", -- only load on lua files
            opts = {
                library = {
                    -- See the configuration section for more details
                    -- Load luvit types when the `vim.uv` word is found
                    { path = "${3rd}/luv/library", words = { "vim%.uv" } },
                },
            },
        },
    },
    {
        "mason-org/mason-lspconfig.nvim",
        opts = {
            -- If sth is failed to install -> run :Mason
            ensure_installed = {
                "lua_ls",        -- lua
                "pyright",       -- python
                "rust_analyzer", -- rust
                "clangd",        -- C / C++
                "neocmakelsp",   -- cmake
                "marksman",      -- markdown
                "lemminx",       -- xml
                "docker-compose-language-service",
                "dockerfile-language-server",
            },
            automatic_enable = false,
        },
        dependencies = {
            { "mason-org/mason.nvim", opts = {} },
            -- requires nvim-lspconfig to load first!!!
        },
    }
}
