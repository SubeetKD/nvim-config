"-------------------------------  Git Magic ---------------
let g:vimspector_enable_mappings = 'HUMAN'
" mappings

" Vim Fugitivie
" nnoremap <leader>gs    :G<cr>
" nnoremap <leader>grm   :GDelete<cr>


" Vim signify

" defautl value is 4000ms , not good for async update
set updatetime=50

" let g:gitgutter_override_sign_column_highlight = 0

" vim git gutter
" nmap ]h                 <Plug>(GitGutterNextHunk)
" nmap [h                 <Plug>(GitGutterPrevHunk)
" nmap <leader>ghs        <Plug>(GitGutterStageHunk)
" nmap <leader>ghu        <Plug>(GitGutterUndoHunk)
" nmap <leader>ghp        <Plug>(GitGutterPreviewHunk)

let g:floaterm_wintype = 'floating'
let g:floaterm_width = 0.8
let g:floaterm_height = 0.8
let g:floaterm_winblend = 10
let g:floaterm_position = 'center'
let g:floaterm_autoclose = 2

nnoremap   <silent>   <F7>    :FloatermNew<CR>
inoremap   <silent>   <F7>    <cmd> FloatermNew<CR>
tnoremap   <silent>   <F7>    <C-\><C-n>:FloatermNew<CR>
nnoremap   <silent>   <F8>    :FloatermPrev<CR>
inoremap   <silent>   <F8>    <cmd> FloatermPrev<CR>
tnoremap   <silent>   <F8>    <C-\><C-n>:FloatermPrev<CR>
nnoremap   <silent>   <F9>    :FloatermNext<CR>
inoremap   <silent>   <F9>    <cmd> FloatermNext<CR>
tnoremap   <silent>   <F9>    <C-\><C-n>:FloatermNext<CR>
nnoremap   <silent>   <F12>   :FloatermToggle<CR>
inoremap   <silent>   <F12>   <cmd> FloatermToggle<CR>
tnoremap   <silent>   <F12>   <C-\><C-n>:FloatermToggle<CR>

command! Lazygit FloatermNew lazygit

nnoremap <leader>gs     <cmd> Lazygit <cr>
