" " " for java lsp
" augroup jdtls
"     autocmd!
"     autocmd FileType java lua require('subeet.lsp.java').start_jdt()
" augroup end

" highlight on yank
augroup highlight_yank
    autocmd!
    autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank({timeout = 200})
augroup END

" rasi config are css
au BufNewFile,BufRead /*.rasi setf css
au BufNewFile,BufRead /*.rasi LspStop

" set vimwiki file type markdown
autocmd FileType vimwiki set filetype=markdown

" set comment string for config files
autocmd FileType *config set commentstring=#\ %s

" I don't think this is working.
" Load the xresoure file on file save, may be switch to fwatch.nvim
autocmd BufWritePost xdefaults !xrdb %

autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

" Meaningful backup name, ex: filename@2015-04-05.14:59
au BufWritePre * let &bex = '@' . strftime("%F.%H:%M")

" automatically run packercompile
autocmd BufWritePost plugins.lua PackerCompile

" auto commands
autocmd TermEnter * setlocal nonu nornu

autocmd CursorHold * lua vim.lsp.diagnostic.show_line_diagnostics({ focusable = false })
