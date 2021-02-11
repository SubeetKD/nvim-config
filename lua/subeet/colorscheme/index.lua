-- Options for different colorscheme

vim.g.molokai_original = 1
vim.g.gruvbox_contrast_dark = "dark"
vim.g.rehash256 = 1
vim.g.onedark_termcolors = 256
vim.g.onedark_terminal_italics = 1
vim.g.ayucolor = "dark"
vim.g.gruvbox_contrast_dark = "dark"
vim.g.gruvbox_invert_selection = '0'
vim.g.oceanic_next_terminal_bold = 1
vim.g.oceanic_next_terminal_italic = 1
vim.b.se16colorspace=256
vim.g.vim_monokai_tasty_italic = 1

-- Setting colorscheme

require('colorbuddy').colorscheme('gruvbuddy')

-- Non direct colorscheme options
vim.g.indentLine_char = '|'

require('subeet.colorscheme.colorizer')

require('subeet.colorscheme.statusline')
