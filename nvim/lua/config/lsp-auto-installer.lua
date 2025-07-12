require 'mason-lspconfig'.setup {
    -- If sth is failed to install -> run :Mason
    ensure_installed = { "lua_ls", "rust_analyzer", "clangd", "marksman", "lemminx", "cmake-language-server" },
}
