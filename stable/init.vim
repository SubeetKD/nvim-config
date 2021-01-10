call plug#begin('~/.config/nvim/autoload')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'preservim/nerdcommenter'

" note and language based tool
Plug 'alvan/vim-closetag'
Plug 'vimwiki/vimwiki'

" Visual improvements
Plug 'Yggdroot/indentLine'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 

" Statusline
Plug 'hoob3rt/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Distraction free writing.
Plug 'junegunn/goyo.vim'

" Colorscheme
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'

call plug#end()

set termguicolors
set nowrap
set cursorline
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard+=unnamedplus
set pumblend=15
set winblend=10
set scrolloff=3
set mouse=a
set updatetime=50

let g:mapleader = ' '

" Heaven's feel
inoremap <A-BS> <C-w>
vmap < <gv
vmap > >gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
nnoremap x "_x
autocmd TermEnter * setlocal nonu nornu
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

autocmd filetype cpp set tabstop=4 shiftwidth=4
autocmd filetype cpp nnoremap <F5> :!g++ -std=c++17 -Wshadow -Wall -g -o program -O2 -Wno-unused-result -DLOCAL "%:r.cpp" <CR>
autocmd filetype java nnoremap <F5> :w <bar> !javac % <CR>
autocmd filetype python nnoremap <F5> :w <bar> !python % <CR>
autocmd filetype cpp nnoremap <F6> <cmd>!./program < in<cr>

" TODO==> see makeprg
" F9/F10 compile/run default file.
" F11/F12 compile/run alternate file.

map <F9> :set makeprg=javac\ %<CR>:make<CR>
map <F10> :!echo %\|awk -F. '{print $1}'\|xargs java<CR>
map <F11> :set makeprg=javac\ #<CR>:make<CR>
map <F12> :!echo #\|awk -F. '{print $1}'\|xargs java<CR>

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.local/src/dot_file/config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

" Colorscheme

let g:molokai_original = 1
let g:rehash256 = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:ayucolor = "dark"
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_invert_selection='0'
let g:oceanic_next_terminal_bold = 0
let g:oceanic_next_terminal_italic = 1

set background=dark

colorscheme OceanicNext
" lua require('colorbuddy').colorscheme('gruvbuddy')
set t_Co=256
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

highlight ColorColumn ctermbg=0 guibg=grey
" highlight Normal guibg=none
" highlight LineNr guifg=#ff8659
" highlight LineNr guifg=#aed75f
highlight LineNr guifg=#5eacd3
highlight netrwDir guifg=#5eacd3
highlight qfFileName guifg=#aed75f
highlight StatusLine guibg=none
highlight StatusLineNC guibg=none

let g:indentLine_char = '|'

" Treesitter support
lua << EOF
local treesitter = require('nvim-treesitter.configs')

treesitter.setup {
    ensure_installed = "all",
    highlight = {
        enable = true,
        disable = {'java'}
    }
}
EOF

let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDAltDelims_java = 1
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1

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


" Status Line
lua << EOF
local lualine = require('lualine')
    lualine.theme = 'onedark'
    lualine.separator = '|'
    lualine.sections = {
      lualine_a = { 'mode' },
      lualine_b = { 'branch' },
      lualine_c = { 'filename' },
      lualine_x = { 'encoding', 'fileformat', 'filetype' },
      lualine_y = { 'progress' },
      lualine_z = { 'location'  },
    }
    lualine.inactive_sections = {
      lualine_a = {  },
      lualine_b = {  },
      lualine_c = { 'filename' },
      lualine_x = { 'location' },
      lualine_y = {  },
      lualine_z = {   }
    }
    lualine.extensions = { 'fzf' }
    lualine.status()
EOF

set hidden
set nobackup
set nowritebackup
set cmdheight=2
set updatetime=10
set shortmess+=c
if has("patch-8.1.1564")
  set signcolumn=number
else
  set signcolumn=yes
endif

let g:coc_global_extensions = [
            \'coc-marketplace', 
            \'coc-snippets',
            \'coc-pairs',
            \'coc-json', 
            \'coc-vimlsp', 
            \'coc-clangd',
            \'coc-pyright',
            \'coc-html'
            \]

let g:coc_snippet_next = '<c-j>'
let g:coc_snippet_prev = '<c-k>'
imap <C-l> <Plug>(coc-snippets-expand)
vmap <C-j> <Plug>(coc-snippets-select)
imap <C-j> <Plug>(coc-snippets-expand-jump)
xmap <leader>x  <Plug>(coc-convert-snippet)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

nmap <silent> [e <Plug>(coc-diagnostic-prev)
nmap <silent> ]e <Plug>(coc-diagnostic-next)

nmap <silent> <leader>vgd <Plug>(coc-definition)
nmap <silent> <leader>vgt <Plug>(coc-type-definition)
nmap <silent> <leader>vgi <Plug>(coc-implementation)
nmap <silent> <leader>vgr <Plug>(coc-references)

nnoremap <silent> <leader>vh :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

autocmd CursorHold * silent call CocActionAsync('highlight')

" https://github.com/neoclide/coc.nvim/issues/609
nnoremap <nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
nnoremap <nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
inoremap <nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
inoremap <nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"

nmap <leader>vrn <Plug>(coc-rename)

xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

xmap <leader>vca  <Plug>(coc-codeaction-selected)
nmap <leader>vca  <Plug>(coc-codeaction-selected)

nmap <leader>vc  <Plug>(coc-codeaction)
nmap <leader>vqf  <Plug>(coc-fix-current)

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

command! -nargs=0 Format :call     CocAction('format')
command! -nargs=? Fold   :call     CocAction('fold', <f-args>)
command! -nargs=0 OR     :call     CocAction('runCommand', 'editor.action.organizeImport')

set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

nnoremap <silent><nowait> <leader>cca  :<C-u>CocList diagnostics<cr>
nnoremap <silent><nowait> <leader>cce  :<C-u>CocList extensions<cr>
nnoremap <silent><nowait> <leader>ccc  :<C-u>CocList commands<cr>
nnoremap <silent><nowait> <leader>cco  :<C-u>CocList outline<cr>
nnoremap <silent><nowait> <leader>ccs  :<C-u>CocList -I symbols<cr>
nnoremap <silent><nowait> <leader>ccj  :<C-u>CocNext<CR>
nnoremap <silent><nowait> <leader>cck  :<C-u>CocPrev<CR>
nnoremap <silent><nowait> <leader>ccp  :<C-u>CocListResume<CR>
nnoremap <silent> <leader>ccm  :<C-u>CocList marketplace<CR>

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
