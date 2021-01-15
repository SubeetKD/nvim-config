local lspconfig = require('lspconfig')

-- Formatting (https://www.reddit.com/r/neovim/comments/jvisg5/lets_talk_formatting_again/)
vim.lsp.handlers["textDocument/formatting"] = function(err, _, result, _, bufnr)
    if err ~= nil or result == nil then
        return
    end
    if not vim.api.nvim_buf_get_option(bufnr, "modified") then
        local view = vim.fn.winsaveview()
        vim.lsp.util.apply_text_edits(result, bufnr)
        vim.fn.winrestview(view)
        if bufnr == vim.api.nvim_get_current_buf() then
            vim.api.nvim_command("noautocmd :update")
        end
    end
end

local on_attach = function(client) "     if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePost <buffer> lua vim.lsp.buf.formatting()]]
        vim.api.nvim_command [[augroup END]]
    end
end

-- TODO(Subeet):

lspconfig.clangd.setup{
    -- don't like clang format
    on_attach = function(client)
        client.resolved_capabilities.document_formatting = false
    end
}
lspconfig.jdtls.setup{
    root_dir = lspconfig.util.root_pattern(".git", "pom.xml", "build.xml"),
    cmd = { "jdtls" }
}
-- lspconfig.pyright.setup{}
lspconfig.pyls.setup{}
lspconfig.vimls.setup{}
lspconfig.efm.setup{
    init_options = {documentFormatting = true},
    default_config = {
        cmd = {
            "efm-langserver",
            "-c",
            [["$HOME/.config/efm-langserver/config.yaml"]]
        }
    },
    filetypes = {
        "python",
        "lua",
        "cpp",
        "javascript",
        "javascriptreact",
        "javascript.jsx",
        "typescript",
        "typescript.tsx",
        "typescriptreact"
    },
    on_attach = on_attach
}
