" Plugins {{{
 
call plug#begin('~/.config/nvim/plugged')

"lsp and autocomplete
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'anott03/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'
Plug 'kosayoda/nvim-lightbulb'

" Helper plugins(TBD)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }  " for fzf-checkout
Plug 'nvim-lua/popup.nvim'  " telescope ...
Plug 'nvim-lua/plenary.nvim' " telescope ...
Plug 'mboughaba/i3config.vim' " i3config

" snippets and commenter
Plug 'norcalli/snippets.nvim'
Plug 'b3nj5m1n/kommentary'
Plug 'nvim-telescope/telescope.nvim'

" Git config
" Plug 'TimUntersberger/neogit'
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'

" note and utility
Plug 'alvan/vim-closetag'
Plug 'vimwiki/vimwiki'
Plug 'romainl/vim-cool'

" Visual improvements
Plug 'junegunn/goyo.vim'
Plug 'Yggdroot/indentLine'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'norcalli/nvim-colorizer.lua'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Statusline
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Colorscheme Messy 

" gitsign compatible (don't know)
Plug 'mhartington/oceanic-next'
Plug 'ayu-theme/ayu-vim'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'Th3Whit3Wolf/one-nvim'
Plug 'chriskempson/base16-vim'

" Not compatible
Plug 'patstockwell/vim-monokai-tasty'
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
" Plug 'gruvbox-community/gruvbox'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'tomasiser/vim-code-dark'
Plug 'glepnir/zephyr-nvim'

call plug#end()

" }}}

" Some defaults {{{

set inccommand=nosplit
set noswapfile
set nobackup
set termguicolors
set nowrap
set tabstop=4
set shiftwidth=4
set expandtab
set clipboard+=unnamedplus
set pumblend=15
set winblend=10
set scrolloff=5
set mouse=a
set updatetime=10
set signcolumn=yes
set nu rnu
set splitright
set splitbelow
set background=dark
set foldmethod=marker
set guifont=JetBrainsMono\ Nerd\ Font\ Mono:h13

let g:python3_host_prog='/usr/bin/python3'
let g:mapleader = ' '

" }}}

" Basic Mappings {{{
inoremap <A-BS> <C-w>
vmap < <gv
vmap > >gv
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
nnoremap x "_x


" window managment
nnoremap <silent> <leader>l 5<C-w>><cr>
nnoremap <silent> <leader>h 5<C-w><<cr>
nnoremap <silent> <leader>j 5<C-w>-<cr>
nnoremap <silent> <leader>k 5<C-w>+<cr>
" }}}

" Autocmd basic and abbr {{{
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

autocmd BufEnter * silent! lcd %:p:h

autocmd filetype cpp nnoremap <F5> :!g++ -std=c++17 -Wshadow -Wall -g -o program -O2 -Wno-unused-result -DLOCAL "%:r.cpp" <CR>
autocmd filetype java nnoremap <F5> :w <bar> !javac % <CR>
" autocmd filetype python nnoremap <F5> :w <bar> !python % <CR>
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

" Git status {{{
nnoremap <leader>gs <cmd>G<cr> 
nnoremap <leader>gc <cmd>Gcommit<cr> 

" for resolving conflict
nnoremap <leader>gch <cmd>diffget //2<cr>
nnoremap <leader>gcl <cmd>diffget //3<cr>

let g:gitblame_message_template = '      <summary> • <date> • <author>'
" lua require('subeet.gitsigns')

" }}}

" Colorscheme and goyo and visual {{{
let g:molokai_original = 1
let g:rehash256 = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:ayucolor = "dark"
let g:gruvbox_contrast_dark = "medium"
let g:gruvbox_invert_selection='0'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let base16colorspace=256
let g:vim_monokai_tasty_italic = 1

colorscheme dracula
" lua require('colorbuddy').colorscheme('gruvbuddy')

set t_Co=256
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

highlight ColorColumn ctermbg=0 guibg=grey
" highlight Normal guibg=none
" highlight LineNr guifg=#ff8542
" highlight LineNr guifg=#aed75f
" highlight LineNr guifg=#5eacd3
" highlight netrwDir guifg=#5eacd3
" highlight qfFileName guifg=#aed75f
" highlight StatusLine guibg=none
" highlight StatusLineNC guibg=none

lua require('subeet.colorizer')

let g:indentLine_char = '|'

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

lua require('subeet.statusline')
" }}}

" Autocompletion, syntax highlighting, snippets {{{
lua require('subeet.treesitter')

autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()

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

" File finder {{{
lua require('subeet.telescope.index')

nnoremap <leader>fdf <cmd>lua require('subeet.telescope.fun').edit_neovim()<cr>
nnoremap <leader>fff <cmd>lua require('subeet.telescope.fun').builtin()<cr>
nnoremap <C-p> <cmd>lua require('subeet.telescope.fun').git_files()<cr>
nnoremap <C-b> <cmd>lua require('subeet.telescope.fun').buffers()<cr>
" }}}
