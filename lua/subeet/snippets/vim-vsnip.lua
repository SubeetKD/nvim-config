-- Mapings
local map = vim.api.nvim_set_keymap

local options_snips = {
    expr = true
}

-- Expand or Jump
-- map('i', '<C-j>',  [[vsnip#expandable(1)   ? '<Plug>(vsnip-expand-or-jump)'     : '<C-j>']], options_snips )
-- map('s', '<C-j>',  [[vsnip#expandable(1)   ? '<Plug>(vsnip-expand-or-jump)'     : '<C-j>']], options_snips )
-- map('i', '<C-k>',  [[vsnip#expandable(-1)  ? '<Plug>(vsnip-jump-prev)'          : '<C-k>']], options_snips )
-- map('s', '<C-k>',  [[vsnip#expandable(-1)  ? '<Plug>(vsnip-jump-prev)'          : '<C-k>']], options_snips )

vim.cmd[[imap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>']]
vim.cmd[[smap <expr> <C-j>   vsnip#available(1)  ? '<Plug>(vsnip-expand-or-jump)' : '<C-j>']]
vim.cmd[[imap <expr> <C-k>   vsnip#available(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-k>']]
vim.cmd[[smap <expr> <C-k>   vsnip#available(-1)  ? '<Plug>(vsnip-jump-prev)' : '<C-k>']]

vim.g.vsnip_filetypes = {
    javascriptreact = 'javascript',
    typescriptreact = 'typescript'
}

vim.g.vsnip_snippet_dir = "~/.config/nvim/lua/subeet/snippets"
