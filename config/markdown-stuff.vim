filetype plugin on

let g:mkdp_browser = 'chromium'

let g:vimwiki_list = [ { 'path' : '~/VimWiki/', 'syntax':'markdown', 'ext': '.md' } ]
autocmd filetype vimwiki setlocal shiftwidth=6 tabstop=6 noexpandtab

autocmd filetype vimwiki,markdown nnoremap <leader>p <cmd>Glow<cr>
