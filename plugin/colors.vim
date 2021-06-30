" let &colorcolumn=join(range(81,999),",")
" set colorcolumn=80

" " edge configuration (more are there)
" let g:edge_style = 'neon'
" let g:edge_enable_italic = 1
" let g:edge_disable_italic_comment = 0
" let g:edge_transparent_background = 0

" " sonokai configuration
" let g:sonokai_disable_italic_comment = 0
" let g:sonokai_enable_italic = 1
" let g:sonokai_transparent_background = 0
" let g:sonokai_diagnostic_text_highlight = 1
" let g:sonokai_diagnostic_line_highlight = 1
" let g:sonokai_diagnostic_virtual_text = 'colored'
" let g:sonokai_better_performance = 1

" colorscheme gruvbox

" make comment and string italic
highlight Comment gui=italic cterm=italic
highlight String gui=italic cterm=italic

" " make the colorscheme transparent
" hi SignColumn guibg=none
" hi CursorLineNR guibg=None
" highlight Normal guibg=none

" " some gruvbox groups
" hi GitSignsAdd guibg=None
" hi GitSignsDelete guibg=None
" hi GitSignsChange guibg=None

" " TODO: change the background of the result under cursor.
" " change the color of the search
" highlight IncSearch gui=underline guifg=#93f542
" highlight Search gui=underline guifg=#ff6c6d

" tokyonight settings
let g:tokyonight_style="storm"

" tokyonight.nvim
" colorscheme tokyonight

" colorscheme onedark
