local map = vim.api.nvim_set_keymap

local options = { noremap = true }

map('i', '<A-BS>', '<C-w>', options)
map('v', '<', '<gv', {})
map('v', '>', '>gv', {})
map('v', 'J', [[:m '>+1<CR>gv=gv]], options)
map('v', 'K', [[:m '<-2<CR>gv=gv]], options)
map('v', 'X', [["_d]], options)
map('n', 'x', [["_x]], options)


-- TODO
-- 1. Good Mappings for managing splits.
