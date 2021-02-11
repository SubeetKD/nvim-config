local map = vim.api.nvim_set_keymap
local options = {noremap = true, silent = true}

map("n", "<leader>ft", [[<cmd>lua require('subeet.telescope.fun').git_files()<cr>]], options)
map("n", "<leader>en", [[<cmd>lua require('subeet.telescope.fun').edit_nvim()<cr>]], options)
map("n", "<leader>fg", [[<cmd>lua require('subeet.telescope.fun').live_grep()<cr>]], options)
map("n", "<leader>ff", [[<cmd>lua require('subeet.telescope.fun').builtin()<cr>]], options)
