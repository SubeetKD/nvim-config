" TODO 
"       * Make better quickfixlist and loclist bindings (currently loclist
"       bindings are not working)
" turn on very magic

" better shifting
vmap > >gv
vmap < <gv

" resizing
nnoremap <A-,> <C-W>>
nnoremap <A-.> <C-W><
nnoremap <A-t> <C-W>+
nnoremap <A-s> <C-W>-

inoremap <A-BS> <C-w>

" terminal mappings
tnoremap <ESC><ESC> <C-\><C-n>

" navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" quickfixlist
nnoremap <C-j> :cnext<CR>zz
nnoremap <C-k> :cprev<CR>zz

" loclist
nnoremap <leader>k :lnext<CR>zz
nnoremap <leader>j :lprev<CR>zz

" Important abbrev
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" keybinding for hop.nvim
" nnoremap w :HopWord<cr>

" Map execute this line
function! s:executor() abort
  if &ft == 'lua'
    call execute(printf(":lua %s", getline(".")))
  elseif &ft == 'vim'
    exe getline(">")
  endif
endfunction
nnoremap <leader>x :call <SID>executor()<CR>

vnoremap <leader>x :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

nnoremap <leader><leader>x :lua __SUBEET.save_and_execute()<cr>

" Had to use the nvim-tree
" nnoremap <silent> <C-n> :lua __SUBEET.toggle_netrw()<cr>
nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>n :NvimTreeFindFile<cr>


" remove trailing spaces
command! -nargs=0 Removetrailingwhitespace lua __SUBEET.remove_trailing_whitespace()

" for git
nnoremap <leader>gs :Git<cr>


" for nvim-dap
nnoremap <silent> <F5> :lua require'dap'.continue()<CR>
nnoremap <silent> <F10> :lua require'dap'.step_over()<CR>
nnoremap <silent> <F11> :lua require'dap'.step_into()<CR>
nnoremap <silent> <F12> :lua require'dap'.step_out()<CR>
nnoremap <silent> <leader>b :lua require'dap'.toggle_breakpoint()<CR>
nnoremap <silent> <leader>B :lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>
nnoremap <silent> <leader>lp :lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>
nnoremap <silent> <leader>dr :lua require'dap'.repl.open()<CR>
nnoremap <silent> <leader>dl :lua require'dap'.run_last()<CR>
