vim.g.mapleader = ' '

-- my config is in lua
vim.cmd[[cnoreabbrev W! w!]]
vim.cmd[[cnoreabbrev Q! q!]]
vim.cmd[[cnoreabbrev Qall! qall!]]
vim.cmd[[cnoreabbrev Wq wq]]
vim.cmd[[cnoreabbrev Wa wa]]
vim.cmd[[cnoreabbrev wQ wq]]
vim.cmd[[cnoreabbrev WQ wq]]
vim.cmd[[cnoreabbrev W w]]
vim.cmd[[cnoreabbrev Q q]]
vim.cmd[[cnoreabbrev Qall qall]]

-- set some local options
require 'subeet.options'

require 'subeet.plugins'

require 'subeet.lsp'
