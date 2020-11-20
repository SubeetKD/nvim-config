" vim : ft=vim
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

"*****************************************************************************
"" Plug install packages
"*****************************************************************************

" Completion
Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'
Plug 'kristijanhusak/completion-tags'

" Diagnostic and lsp
Plug 'neovim/nvim-lspconfig'

" Formatter
Plug 'mhartington/formatter.nvim'

"" --- Language specific plugins
Plug 'tjdevries/nlua.nvim'

"---- File managment
"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
" Plug 'mbbill/undotree'

"--------- Git Plugins ----------
"
Plug 'f-person/git-blame.nvim'

Plug 'norcalli/snippets.nvim'
Plug 'vimwiki/vimwiki'

"---- utility plugins
Plug 'glepnir/indent-guides.nvim'
Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(420) } }
Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'kyazdani42/nvim-tree.lua'
Plug 'mhinz/vim-startify'
Plug 'romgrk/barbar.nvim'
Plug 'akinsho/nvim-toggleterm.lua'

"========== Syntax highlight -------

" Plug 'Yggdroot/indentLine'
Plug 'mboughaba/i3config.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'


Plug 'tjdevries/express_line.nvim'
Plug 'norcalli/nvim.lua'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'tjdevries/colorbuddy.vim'
Plug 'glepnir/zephyr-nvim'
Plug 'p00f/nvim-ts-rainbow'

"================ Color Schemes ======================="

Plug 'tjdevries/gruvbuddy.nvim'
Plug 'gruvbox-community/gruvbox'
Plug 'bluz71/vim-moonfly-colors'

call plug#end()
" }}}

" basic {{{
 
 "------------------------------ Basic Configuration ----------------------

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
set guifont=JetBrainsMono\ Nerd\ Font:h12
set backspace=indent,eol,start
" How to set this so it won't break config
" set list listchars=eol:¬

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


"------------------------ Competitive coding ------

" Write a better method
" autocmd filetype cpp nnoremap <F2> :FloatermNew cf test ; read <cr>
" autocmd filetype cpp nnoremap <F3> :FloatermNew cf submit ; read <cr>


"------------------------ Autocmd ------------------

" Delete white trailing spaces
" autocmd BufWritePre * %s/\s\+$//e

" for compiling c++
autocmd filetype cpp nnoremap <F7> :!g++ -std=c++17 -Wshadow -Wall -g -o program -O2 -Wno-unused-result -DLOCAL "%:r.cpp" <CR>
" autocmd filetype cpp nnoremap <F8> :FloatermNew --autoclose=0 ./program<CR>

" Run xrdb whenever Xdefaults or Xresources are updated.
autocmd BufWritePost *Xresources,*Xdefaults !xrdb %

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd

aug i3config_ft_detection
  au!
  au BufNewFile,BufRead ~/.local/src/dot_file/config/i3/config set filetype=i3config
  au BufNewFile,BufRead ~/.config/i3/config set filetype=i3config
aug end

let g:vimwiki_list = [{'path': '~/vimwiki/',
                      \ 'syntax': 'markdown', 'ext': '.md'}]
" }}}

" Treesitter {{{ 
lua require('treesitter-config')
" }}} 

" Colorscheme {{{
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "soft"

let g:nvcode_termcolors=256

" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme

let g:moonflyCursorColor = 1
let g:moonflyTerminalColors = 0
let g:moonflyUnderlineMatchParen = 1
let g:moonflyUndercurls = 0
let g:moonflyItalics = 1

set bg=dark
" colorscheme gruvbox
" colorscheme nord
 " colorscheme moonfly
" colorscheme OceanicNext
" colorscheme ayu
" lua require('colorbuddy').colorscheme('gruvbuddy')
lua require('zephyr')

" lua require('indent_guides').default_opts = { indent_levels = 30; indent_guide_size = 0; indent_start_level = 1; indent_space_guides = true; indent_tab_guides = true; indent_pretty_guides = true; indent_soft_pattern = '\\s'; exclude_filetypes = {'help'} }

lua require 'colorizer'.setup(nil, { css = true; })

lua require('statusline-config')

highlight Comment cterm=italic gui=italic

hi LineNr ctermbg=NONE guibg=NONE

" hi Normal guibg=NONE ctermbg=NONE

let g:rainbow_active = 1
let g:rainbow_conf = {
\	'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
\	'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
\	'guis': [''],
\	'cterms': [''],
\	'operators': '_,_',
\	'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
\	'separately': {
\		'*': {},
\		'markdown': {
\			'parentheses_options': 'containedin=markdownCode contained',
\		},
\		'lisp': {
\			'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
\		},
\		'haskell': {
\			'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/\v\{\ze[^-]/ end=/}/ fold'],
\		},
\		'vim': {
\			'parentheses_options': 'containedin=vimFuncBody',
\		},
\		'perl': {
\			'syn_name_prefix': 'perlBlockFoldRainbow',
\		},
\		'stylus': {
\			'parentheses': ['start=/{/ end=/}/ fold contains=@colorableGroup'],
\		},
\		'css': 0,
\       'vimwiki':0,
\	}
\}

" }}} 

" Git Configuration {{{
let g:gitblame_enabled  = 1
let g:gitblame_message_template = '<summary> • <date> • <author>'
" }}} 

" Starttify telescope and Formatter {{{ 

" Automatic save sessions
let g:startify_session_persistence = 1

let g:startify_lists = [
      \ { 'type': 'sessions',  'header': ['   Sessions']       },
      \ { 'type': 'files',     'header': ['   MRU']            },
      \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
      \ { 'type': 'commands',  'header': ['   Commands']       },
      \ ]

" Formatter.nvim
lua require('custom-format')
autocmd BufWritePost *.cpp,*.js,*.lua silent! Format

" Telescope.nvim

lua require('my_finder')
nnoremap <leader>tff <cmd>lua require('my_finder').find_files()<cr>
nnoremap <leader>tdf <cmd>lua require('my_finder').edit_dotfile()<cr>
nnoremap <leader>tfb <cmd>lua require('my_finder').buffer()<cr>
nnoremap <leader>trg <cmd>lua require('my_finder').live_grep()<cr>
nnoremap <leader>tbb <cmd>lua require('telescope.builtin').builtin()<cr>

" }}} 

" Completion snippets and diagnostic {{{ 
" snippets.nvim

inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>
inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

" diagnostic is also here
lua require('completion_config')

" Mapings for easy navigations
nnoremap ]e <cmd> lua vim.lsp.diagnostic.goto_prev() <cr>
nnoremap [e <cmd> lua vim.lsp.diagnostic.goto_next() <cr>

""------------- completion-nvim

" Some options i don't understand

let g:completion_auto_change_source = 1

let g:completion_enable_auto_popup = 1

let g:completion_matching_strategy_list = ['exact','substring','fuzzy']

let g:completion_enable_snippet = 'snippets.nvim'

let g:completion_chain_complete_list = [
            \  {'complete_items': ['path'],'triggered_only' : ['/']},
            \  {'complete_items': ['lsp']},
            \  {'complete_items': ['tags']},
            \  {'complete_items': ['snippet','buffers']},
            \  {'mode': '<c-p>'},
            \  {'mode': '<c-n>'}
            \]

let g:completion_enable_auto_hover = 0

let g:Completion_matching_smart_case = 0

autocmd BufEnter * lua require'completion'.on_attach()

" Set completeopt to have a better completion experience
set completeopt=menuone,noselect

" Avoid showing message extra message when using completion
set shortmess+=c

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ pumvisible() ? "\<C-n>" :
  \ <SID>check_back_space() ? "\<TAB>" :
  \ completion#trigger_completion()


 let g:completion_confirm_key = ""
 imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                  \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

"-------- Nvim - lsp

lua require('nvim-lspconfig')

"------------- Mapings for nvim-lsp

nnoremap <leader>vd :lua vim.lsp.buf.definition()<CR>
nnoremap <leader>vi :lua vim.lsp.buf.implementation()<CR>
nnoremap <leader>vsh :lua vim.lsp.buf.signature_help()<CR>
nnoremap <leader>vrr :lua vim.lsp.buf.references()<CR>
" nnoremap <leader>vrn :lua require('nvim-lspconfig').MyLspRename() <CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
" nnoremap <leader>vrn :lua vim.lsp.buf.rename()<cr>
nnoremap <leader>vrn :lua MyLspRename() <cr>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>

" --- nvim web devicons
lua require'nvim-web-devicons'.setup()

" }}} 

" Firenvim Configuration {{{ 
if exists('g:started_by_firenvim')
  set laststatus=0
else
  set laststatus=2
endif
au BufEnter github.com_*.txt set filetype=markdown
au BufEnter *interviewbit.com_*.txt set filetype=cpp

let g:firenvim_config = { 
    \ 'globalSettings': {
        \ 'alt': 'all',
    \  },
    \ 'localSettings': {
        \ '.*': {
            \ 'cmdline': 'neovim',
            \ 'priority': 0,
            \ 'selector': 'textarea',
            \ 'takeover': 'always',
        \ },
    \ }
\ }

let fc = g:firenvim_config['localSettings']
let fc['https?://youtube.com/'] = { 'takeover': 'never', 'priority': 1 }
" }}}

" Nvim lua tree {{{
let g:lua_tree_side = 'left'  "left by default
let g:lua_tree_width = 40 "30 by default
let g:lua_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:lua_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:lua_tree_auto_close = 0 "0 by default, closes the tree when it's the last window
let g:lua_tree_quit_on_open = 0 "0 by default, closes the tree when you open a file
let g:lua_tree_follow = 0 "0 by default, this option allows the cursor to be updated when entering a buffer
" let g:lua_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
" let g:lua_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
" let g:lua_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
" let g:lua_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
" let g:lua_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
" let g:lua_tree_allow_resize = 1 "0 by default, will not resize the tree when opening a file
let g:lua_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 0,
    \ 'files': 0,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:lua_tree_bindings = {
    \ 'edit':            ['<CR>', 'o'],
    \ 'edit_vsplit':     '<C-v>',
    \ 'edit_split':      '<C-x>',
    \ 'edit_tab':        '<C-t>',
    \ 'toggle_ignored':  'I',
    \ 'toggle_dotfiles': 'H',
    \ 'refresh':         'R',
    \ 'preview':         '<Tab>',
    \ 'cd':              '<C-]>',
    \ 'create':          'a',
    \ 'remove':          'd',
    \ 'rename':          'r',
    \ 'cut':             'x',
    \ 'copy':            'c',
    \ 'paste':           'p',
    \ 'prev_git_item':   '[c',
    \ 'next_git_item':   ']c',
    \ }

" Disable default mappings by plugin
" Bindings are enable by default, disabled on any non-zero value
" let lua_tree_disable_keybindings=1

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:lua_tree_icons = {
    \ 'default': '',
    \ 'symlink': '',
    \ 'git': {
    \   'unstaged': "✗",
    \   'staged': "✓",
    \   'unmerged': "",
    \   'renamed': "➜",
    \   'untracked': "★"
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': ""
    \   }
    \ }

nnoremap <C-n> :LuaTreeToggle<CR>
nnoremap <leader>r :LuaTreeRefresh<CR>
nnoremap <leader>n :LuaTreeFindFile<CR>
" LuaTreeOpen and LuaTreeClose are also available if you need them

" a list of groups can be found at `:help lua_tree_highlight`
highlight LuaTreeFolderIcon guibg=blue
" }}}

" BarBar.nvim {{{
" Magic buffer-picking mode
nnoremap <silent> <C-s> :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <Space>bd :BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bl :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent>   <leader>, :BufferPrevious<CR>
nnoremap <silent>   <leader>. :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <leader>< :BufferMovePrevious<CR>
nnoremap <silent>    <leader>> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <leader>1 :BufferGoto 1<CR>
nnoremap <silent>    <leader>2 :BufferGoto 2<CR>
nnoremap <silent>    <leader>3 :BufferGoto 3<CR>
nnoremap <silent>    <leader>4 :BufferGoto 4<CR>
nnoremap <silent>    <leader>5 :BufferGoto 5<CR>
nnoremap <silent>    <leader>6 :BufferGoto 6<CR>
nnoremap <silent>    <leader>7 :BufferGoto 7<CR>
nnoremap <silent>    <leader>8 :BufferGoto 8<CR>
nnoremap <silent>    <leader>9 :BufferLast<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" }}}

" Terminal Integration {{{
lua require('terminal-config')
nnoremap <F8> <cmd>ToggleTerm<cr>
" }}}
