vim.g.nvim_tree_width = 40
vim.g.nvim_tree_ignore = { '.git', 'node_modules', '.cache' }
vim.g.nvim_tree_follow = 1
vim.g.nvim_tree_indent_markers = 1
vim.g.nvim_tree_git_hl = 1
vim.g.nvim_tree_width_allow_resize = 1
vim.g.nvim_tree_show_icons = { git= 1, folders= 1, files= 1 }

local options = { noremap = true }

vim.api.nvim_set_keymap('n', '<C-n>', '<cmd>NvimTreeToggle<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>r', '<cmd>NvimTreeToggle<cr>', options)
vim.api.nvim_set_keymap('n', '<leader>n', '<cmd>NvimTreeFindFile<cr>', options)

vim.cmd[[highlight NvimTreeFolderIcon guibg=none]]
