let g:fzf_preview_windo = 'right:60%'
let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.95 } }
let $FZF_DEFAULT_OPTS='--layout=reverse'
" let g:fzf_layout = { 'window': 'call FloatingFZF()' }

" function! FloatingFZF()
"   let buf = nvim_create_buf(v:false, v:true)
"   call setbufvar(buf, '&signcolumn', 'no')

"   let height = &lines - 3
"   let width = float2nr(&columns - (&columns * 2 / 10))
"   let col = float2nr((&columns - width) / 2)

"   let opts = {
"         \ 'relative': 'editor',
"         \ 'row': 1,
"         \ 'col': col,
"         \ 'width': width,
"         \ 'height': height
"         \ }

"   call nvim_open_win(buf, v:true, opts)
" endfunction
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', '#000'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history
" - History files will be stored in the specified directory
" - When set, CTRL-N and CTRL-P will be bound to 'next-history' and
"   'previous-history' instead of 'down' and 'up'.
let g:fzf_history_dir = '~/.local/share/fzf-history'
nnoremap <C-p> <cmd>Files<cr>
nnoremap <C-b> <cmd>Buffers<cr>
nnoremap <C-g> <cmd>Rg<cr>
