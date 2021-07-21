local opt = vim.opt

-- enable when using venn
-- opt.virtualedit = 'all'             -- for selecting region beyond limit

opt.mouse="a"

opt.cursorline = true

opt.autoread = true                 -- read file when changed
opt.autowrite = true                -- write file if changed

-- TODO: Need to figure out.
opt.backup = true                   -- turn on the backup
-- opt.backupdir = '~/coding/nvim_backup//' -- location of backup
vim.cmd("set backupdir=~/.config/nvim/backup//")

opt.writebackup = true              -- make backup before overwriting
opt.backupcopy = 'yes'              -- overwrite the original backup

opt.belloff = 'all'                 -- turn off the bells

opt.swapfile = false                -- turn off the swapfile
opt.emoji = false                   -- don't assume emoji's size

-- set the fillchars
opt.fillchars = 'eob: ,diff:∙,fold:·,vert:┃'

opt.showmatch = true                              -- show the matching paren
opt.smartcase = true                              -- for better searching
opt.signcolumn='yes'                              -- continous changing ais annoying

opt.clipboard = 'unnamedplus'

-- tab matters
local tab_size = 4
opt.tabstop=tab_size
opt.shiftwidth=tab_size
opt.expandtab = true
opt.cindent = true

opt.termguicolors = true                          -- better colors
opt.background = 'dark'                           -- dark background
opt.number = true                                 -- show current numebr line
opt.relativenumber = true                         -- show relative line of other line

-- completion menu configuration
opt.completeopt='menuone,noinsert,noselect,preview'
-- better searching
opt.inccommand = 'split'
opt.hlsearch = true
opt.incsearch = true


-- vim.cmd("colorscheme NeoSolarized")
