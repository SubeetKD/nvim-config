local map = vim.api.nvim_set_keymap

local options = { noremap = true }

-- vim fugitive mappings
map('n', '<leader>gs', [[<cmd>G<cr>]], options)
map('n', '<leader>gc', [[<cmd>Gcommit<cr>]], options)

vim.g.gitblame_message_template = "      <summary> • <date> • <author>"

require('subeet.git.gitsigns')
