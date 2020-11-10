local on_attach_vim = function()
    require'completion'.on_attach()
    require'diagnostic'.on_attach()
end
require'nvim_lsp'.clangd.setup{on_attach=on_attach_vim}
require'nvim_lsp'.vimls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.pyls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.tsserver.setup{on_attach=on_attach_vim}
require'nvim_lsp'.sumneko_lua.setup{on_attach=on_attach_vim}
