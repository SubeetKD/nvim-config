vim.cmd[[autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()]]

local map = vim.api.nvim_set_keymap

local options = { noremap = true, expr = true }

map('i', '<Tab>', [[pumvisible() ? "\<C-n>" : "\<Tab>"]], options)
map('i', '<S-Tab>', [[pumvisible() ? "\<C-p>" : "\<S-Tab>"]], options)
