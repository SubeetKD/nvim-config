lua require('subeet.plugins')
lua require('subeet.basic.options')
lua require('subeet.basic.maps')
lua require('subeet.basic.abbr')

" Remaining viml
" Autocmd will be sourced from init.vim
autocmd TermEnter * setlocal nonu nornu

autocmd filetype cpp nnoremap <F5> :!g++ -std=c++17 -Wshadow -Wall -g -o program -O2 -Wno-unused-result -DLOCAL "%:r.cpp" <CR>
autocmd filetype java nnoremap <F5> :w <bar> !javac % <CR>
autocmd filetype python nnoremap <F5> :w <bar> !python % <CR>
autocmd filetype cpp nnoremap <F6> <cmd>!./program < in<cr>

" F9/F10 compile/run default file.
" F11/F12 compile/run alternate file.
autocmd filetype java map <F9> :set makeprg=javac\ %<CR>:make<CR>
autocmd filetype java map <F10> :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
autocmd filetype java map <F11> :set makeprg=javac\ #<CR>:make<CR>
autocmd filetype java map <F12> :!echo #\|awk -F. '{print $1}'\|xargs java<CR>
autocmd filetype python map <F9> :set makeprg=python\ %<cr>:make<cr>

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.local/src/dot_file/config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" }}}

" Colorscheme and goyo and visual {{{

set t_Co=256
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

lua require('subeet.colorscheme.index')

highlight ColorColumn ctermbg=0 guibg=grey
" highlight Normal guibg=none
" highlight LineNr guifg=#ff8542
" highlight LineNr guifg=#aed75f
" highlight LineNr guifg=#5eacd3
" highlight netrwDir guifg=#5eacd3
" highlight qfFileName guifg=#aed75f
highlight StatusLine guibg=none
highlight StatusLineNC guibg=none

" GOYO Fun
function! s:goyo_enter()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status off
    silent !tmux list-panes -F '\#F' | grep -q Z || tmux resize-pane -Z
  endif
  set noshowmode
  set noshowcmd
  set scrolloff=999
"  Limelight
  " ...
endfunction

function! s:goyo_leave()
  if executable('tmux') && strlen($TMUX)
    silent !tmux set status on
    silent !tmux list-panes -F '\#F' | grep -q Z && tmux resize-pane -Z
  endif
  set showmode
  set showcmd
  set scrolloff=5
  " Limelight!
  " ...
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()
" }}}

" Git status {{{
nnoremap <leader>gs <cmd>G<cr> 
nnoremap <leader>gc <cmd>Gcommit<cr> 

" for resolving conflict
nnoremap <leader>gch <cmd>diffget //2<cr>
nnoremap <leader>gcl <cmd>diffget //3<cr>

let g:gitblame_message_template = '      <summary> • <date> • <author>'
lua require('subeet.gitsigns')

" }}}

" Autocompletion, syntax highlighting, snippets {{{
lua require('subeet.treesitter')

"autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

lua require('subeet.snippets.snips')

lua require('subeet.lsp.index')

" Completion.nvim config

set shortmess+=c
set completeopt=menuone,noinsert,noselect

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

let g:completion_enable_snippet = 'snippets.nvim'
let g:completion_enable_auto_hover = 1
let g:completion_enable_auto_paren = 0
let g:completion_matching_smart_case = 1
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
let g:completion_trigger_keyword_length = 2
let g:completion_trigger_on_delete = 1
let g:completion_timer_cycle = 200
let g:completion_auto_change_source = 1

autocmd BufEnter * lua require'completion'.on_attach()
nnoremap <leader>lll <cmd>e ~/.local/share/nvim/lsp.log <cr>
" Don't know if needed ~/home
let g:completion_confirm_key = ""
imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

lua require('subeet.lsp.lspsaga')

" }}}

" Commenter, closetag, vimwiki {{{
lua require('subeet.utils.commenter')

let g:closetag_filenames = '*.html,*.xhtml,*.phtml'
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx'
let g:closetag_filetypes = 'html,xhtml,phtml'
let g:closetag_xhtml_filetypes = 'xhtml,jsx'
let g:closetag_emptyTags_caseSensitive = 1
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ }
let g:closetag_shortcut = '>'

" Vimwiki
let g:vimwiki_list = [{'path':'~/vimwiki','syntax':'markdown','ext':'.md',
            \'auto_diary_index':1}]
let g:vimwiki_ext2syntax = {'.md':'markdown','.markdown':'markdown','.mdown':'markdown'}
" }}}

" File finder
lua require('subeet.telescope.index')
lua require('subeet.utils.nvim-tree')
