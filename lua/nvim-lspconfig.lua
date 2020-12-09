local nvim_lsp = require("lspconfig")
local completion = require("completion")

local custom_attach = function()
    completion.on_attach()
end

nvim_lsp.clangd.setup(
    {
        on_attach = custom_attach
    }
)

nvim_lsp.sumneko_lua.setup({on_attach = custom_attach})
nvim_lsp.vimls.setup {on_attach = custom_attach}
nvim_lsp.tsserver.setup {on_attach = custom_attach}
nvim_lsp.pyls_ms.setup {on_attach = custom_attach}
