require 'mason-lspconfig'.setup {
    -- If sth is failed to install -> run :Mason
    ensure_installed = {
        "lua_ls",        -- lua
        "pyright",       -- python
        "rust_analyzer", -- rust
        "clangd",        -- C / C++
        "neocmakelsp",   -- cmake
        "marksman",      -- markdown
        "lemminx",       -- xml
    },
}
