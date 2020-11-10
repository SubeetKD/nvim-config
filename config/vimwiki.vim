set nocompatible
filetype plugin on
let wiki_1 = {}
let wiki_1.path = '~/vimwiki/'
let wiki_1.syntax = 'markdown'
let wiki_1.ext = '.md'
let g:vimwiki_list = [wiki_1]
let g:vimwiki_ext2syntax = {'.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
let g:instant_markdown_autostart = 0	" disable autostart
map <leader>md :Glow<CR>
