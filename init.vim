  "vim : ft=vim
 " ______________________________
" < terminal is a text editor ?? >
 " ------------------------------
 "        \   ^__^
 "         \  (oo)\_______
 "            (__)\       )\/\
 "                ||----w |
 "                ||     ||
 "
set fileencoding=utf-8

" Bootstraping {{{ 
let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else
  let curl_exists=expand('curl')
endif

if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"



  autocmd VimEnter * PlugInstall
endif
" }}}

" Plugins list {{{
" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

" Lsp stuff
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'

" Linting 
" Plug 'dense-analysis/ale'

" Telescope and utility lua 
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Snippets formatter linter syntax
Plug 'norcalli/snippets.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'kyazdani42/nvim-web-devicons'

" simplet tools
Plug 'tpope/vim-commentary'
Plug 'mboughaba/i3config.vim'

" Colorscheme 
Plug 'ayu-theme/ayu-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'drewtempelmeyer/palenight.vim'

call plug#end()
" }}}

" basic {{{
 
 "------------------------------ Basic Configuration ----------------------

set smartindent
set cindent
set cursorline
set smartcase
set termguicolors
set ignorecase
set clipboard+=unnamedplus
set tabstop=4 shiftwidth=4
set expandtab
set noswapfile
set mouse=a
set nowrap
set splitright
set splitbelow
set winblend=0
set nu rnu
set pumblend=25                 " set transparency in pop-up menu
set foldmethod=marker
set scrolloff=8
set guifont=SauceCodePro\ Nerd\ Font:h18
set backspace=indent,eol,start

if has("persistent_undo")
    set undodir="/home/subeet/.config/nvim/undodir"
    set undofile
endif

set colorcolumn=80
highlight ColorColumn ctermfg=cyan guibg=#679889
"---------------------- Mapings -----------------

let mapleader=' '

vmap < <gv
vmap > >gv

" Map <CR> to :nohl, except in quickfix windows
nnoremap <silent> <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ":nohl\<CR>"

" Source init.vim
nnoremap sho <cmd> so $MYVIMRC<cr>

inoremap <A-BS> <C-W>

" Ascii magic
" nmap <leader>f :.!toilet -w 200 -f standar <cr>
nmap <leader>1 :.!toilet -w 200 -f term -F border <cr>

" -------------------- Making life easy
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
nnoremap x "_x

" ----------------- Terminal Emulation -------

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

" Vim Galore recommended mappings
" Make next and previous use smart history
cnoremap <C-N> <Up>
cnoremap <C-P> <Down>


"------------------------ Autocmd ------------------

" Delete white trailing spaces
" autocmd BufWritePre * %s/\s\+$//e

" for compiling c++
autocmd filetype cpp nnoremap <F5> :!g++ -std=c++17 -Wshadow -Wall -g -o program -O2 -Wno-unused-result -DLOCAL "%:r.cpp" <CR>
autocmd filetype java nnoremap <F5> :w <bar> !javac % <CR>
autocmd filetype python nnoremap <F5> :w <bar> !python % <CR>

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.local/src/dot_file/config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.local/src/dot_file/config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" }}}

" Colorscheme {{{
fun! ColorMyPencils()
    colorscheme onedark
    set background=dark

    let g:gruvbox_contrast_dark = 'hard'
    if exists('+termguicolors')
        let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
        let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    endif
    let g:gruvbox_invert_selection='0'

    highlight ColorColumn ctermbg=0 guibg=grey
    " highlight Normal guibg=none
    " highlight LineNr guifg=#ff8659
    " highlight LineNr guifg=#aed75f
    highlight LineNr guifg=#5eacd3
    highlight netrwDir guifg=#5eacd3
    highlight qfFileName guifg=#aed75f
endfun
call ColorMyPencils()
" }}}

" Treesitter and icons {{{

lua require('subeet.treesitter')

" }}}
 
" LSP {{{
" snippets.nvim
lua require('subeet.snippets.index')
inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>
inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>
 

" Set completeopt to have a better completion experience
set completeopt=menuone,noinsert,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

imap <tab> <Plug>(completion_smart_tab)
imap <s-tab> <Plug>(completion_smart_s_tab)

let g:completion_enable_snippet = 'snippets.nvim'
 
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
 
let g:completion_matching_smart_case = 1
 
let g:completion_trigger_character = ['.','::']
 
let g:completion_trigger_on_delete = 1
 
" let g:completion_trigger_character = 3

autocmd BufEnter * lua require'completion'.on_attach()

lua require('subeet.lsp')

" Ale setup
" let g:ale_disable_lsp = 1

" let g:ale_linters = {
"             \ 'javascript' : ['eslint'],
"             \ 'cpp' : ['cpplint'],
"             \ 'python' : ['pylint'],
"             \}

" let g:ale_linters_explicit = 1

" let g:ale_sign_error = '>>'
" let g:ale_sign_warning = '--'

" nmap <silent> [e <Plug>(ale_previous_wrap)
" nmap <silent> ]e <Plug>(ale_next_wrap)

" let g:ale_completion_enabled = 0

" let g:ale_fix_on_save = 1
" let g:ale_fixers = {
" \   'javascript': ['prettier','eslint'],
" \   'python' : [ 'black' ],
" \   'cpp' : [ 'clang-format' ],
" \}
" }}}

" Telescope and utility {{{
lua require('subeet.telescope')
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" }}}
