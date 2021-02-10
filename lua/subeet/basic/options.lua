local tab_cnt = 4

-- Global Options
vim.o.inccommand = 'nosplit'
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.background = "dark"
vim.o.backup = false
vim.o.expandtab = true
vim.o.tabstop = tab_cnt
vim.o.shiftwidth = tab_cnt
vim.o.clipboard = vim.o.clipboard .. "unnamedplus"
vim.o.pumblend = 15
vim.o.winblend = 10
vim.o.scrolloff = 5
vim.o.updatetime = 10
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.mouse = "a"
vim.o.guifont = "JetBrainsMono Nerd Font Mono:h13"

-- Local to window
vim.wo.wrap = false
-- vim.wo.winblend = 10
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.signcolumn = "yes"
vim.wo.foldmethod = "marker"

-- Buffer options
vim.bo.expandtab = true
vim.bo.tabstop = tab_cnt
vim.bo.shiftwidth = tab_cnt

vim.g.mapleader = ' '
vim.g.python3_host_prog = '/usr/bin/python'
