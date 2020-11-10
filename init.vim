" vim : ft=vim
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

Plug 'nvim-lua/completion-nvim'
Plug 'steelsojka/completion-buffers'

Plug 'nvim-lua/diagnostic-nvim'
Plug 'neovim/nvim-lspconfig'

Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }

Plug 'mhartington/formatter.nvim'

"---- File managment
"
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'
Plug 'mbbill/undotree'

"--------- Git Plugins ----------

Plug 'norcalli/snippets.nvim'
Plug 'vimwiki/vimwiki'

"---- utility plugins

Plug 'tpope/vim-commentary'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-surround'
Plug 'kyazdani42/nvim-web-devicons' " for file icons
Plug 'mhinz/vim-startify'

"========== Syntax highlight -------

Plug 'Yggdroot/indentLine'
Plug 'mboughaba/i3config.vim'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'nvim-treesitter/nvim-treesitter-refactor'

"================ Color Schemes ======================="

Plug 'glepnir/galaxyline.nvim'
Plug 'norcalli/nvim.lua'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ryanoasis/vim-devicons'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'christianchiarulli/nvcode-color-schemes.vim'

" Don't use now
Plug 'luochen1990/rainbow'
Plug 'gruvbox-community/gruvbox'
Plug 'sainnhe/gruvbox-material'
Plug 'NieTiger/halcyon-neovim'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'ghifarit53/tokyonight-vim'
Plug 'chriskempson/base16-vim'
Plug 'ayu-theme/ayu-vim' " or other package manager
call plug#end()
" }}}

" basic {{{
 
 "------------------------------ Basic Configuration ----------------------

set smartcase
set termguicolors
set ignorecase
set clipboard+=unnamedplus
set tabstop=4 shiftwidth=4
" set tabstop=2 shiftwidth=2
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
set guifont=Hack\ Nerd\ Font:h17

if has("persistent_undo")
    set undodir="/home/subeet/.config/nvim/undodir"
    set undofile
endif

set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=grey
"---------------------- Mapings -----------------

let mapleader=' '

vmap < <gv
vmap > >gv

" Map <CR> to :nohl, except in quickfix windows
nnoremap <silent> <expr> <CR> &buftype ==# 'quickfix' ? "\<CR>" : ":nohl\<CR>"

" Source init.vim
nnoremap sho <cmd> so $MYVIMRC<cr>


" -------------------- Making life easy
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv
vnoremap X "_d
nnoremap x "_x

" Map Ctrl-Backspace to delete the previous word in insert mode.
inoremap <C-BS> <C-W>

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

" Colorscheme {{{
let g:palenight_terminal_italics = 1
let g:palenight_termcolors = 256

let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_contrast_light = "soft"

" let g:base16_color_modifiers = {'Comment': 'fg=brown'}
" let g:base16_transparent_background = 1
let base16colorspace=256  " Access colors present in 256 colorspace

let g:tokyonight_style = 'night' "storm or night
let g:tokyonight_enable_italic = 1

let g:nvcode_termcolors=256

" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme

set bg=dark
" colorscheme palenight
" colorscheme tokyonight
" colorscheme codedark
" colorscheme gruvbox
colorscheme snazzy
" colorscheme base16-tomorrow-night
" colorscheme base16-oceanicnext
" colorscheme nvcode
" colorscheme ayu

" And then somewhere in your vimrc, to set the colorscheme
" lua require('colorbuddy').colorscheme('gruvbuddy')

lua require 'colorizer'.setup(nil, { css = true; })

lua require('galaxyline-config')

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

" Don't use anymore
" let g:airline_theme='base16'
" " vim-airline
" let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#ale#enabled = 1
" let g:airline#extensions#tabline#enabled = 0
" let g:airline#extensions#tagbar#enabled = 1
" let g:airline_skip_empty_sections = 1

" let g:airline_powerline_fonts = 1

" " vim-airline
" if !exists('g:airline_symbols')
"   let g:airline_symbols = {}
" endif

" if !exists('g:airline_powerline_fonts')
"   let g:airline#extensions#tabline#left_sep = ' '
"   let g:airline#extensions#tabline#left_alt_sep = '|'
"   let g:airline_left_sep          = '▶'
"   let g:airline_left_alt_sep      = '»'
"   let g:airline_right_sep         = '◀'
"   let g:airline_right_alt_sep     = '«'
"   let g:airline#extensions#branch#prefix     = '➔' "➔, ➥, ⎇ ⤴
"   let g:airline#extensions#readonly#symbol   = '⊘'
"   let g:airline#extensions#linecolumn#prefix = '¶'
"   let g:airline#extensions#paste#symbol      = 'ρ'
"   let g:airline_symbols.linenr    = '␊'
"   let g:airline_symbols.branch    = '⎇'
"   let g:airline_symbols.paste     = 'ρ'
"   let g:airline_symbols.paste     = 'Þ'
"   let g:airline_symbols.paste     = '∥'
"   let g:airline_symbols.whitespace = 'Ξ'
" else
"   let g:airline#extensions#tabline#left_sep = ''
"   let g:airline#extensions#tabline#left_alt_sep = ''

"   " powerline symbols
"   let g:airline_left_sep = ''
"   let g:airline_left_alt_sep = ''
"   let g:airline_right_sep = ''
"   let g:airline_right_alt_sep = ''
"   let g:airline_symbols.branch = ''
"   let g:airline_symbols.readonly = ''
"   let g:airline_symbols.linenr = ''
" endif
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

" }}} 

" Completion snippets and diagnostic {{{ 
" snippets.nvim

inoremap <c-k> <cmd>lua return require'snippets'.expand_or_advance(1)<CR>
inoremap <c-j> <cmd>lua return require'snippets'.advance_snippet(-1)<CR>

lua require('completion_config')

"-------------- diagnostic-nvim
let g:diagnostic_show_sign = 0
let g:diagnostic_enable_virtual_text = 1
let g:diagnostic_trimmed_virtual_text = '180'
let g:space_before_virtual_text = 10
let g:diagnostic_virtual_text_prefix = ' '
let g:diagnostic_enable_underline = 1

" Mapings for easy navigations
nnoremap ]e :NextDiagnosticCycle<cr>
nnoremap [e :PrevDiagnosticCycle<cr>

""------------- completion-nvim

" Some options i don't understand

let g:completion_auto_change_source = 1

let g:completion_enable_auto_popup = 0

let g:completion_matching_strategy_list = ['exact','substring','fuzzy']

let g:completion_enable_snippet = 'snippets.nvim'

let g:completion_chain_complete_list = [
            \  {'complete_items': ['path'],'triggered_only' : ['/']},
            \  {'complete_items': ['lsp','snippet','buffers']},
            \  {'mode': '<c-p>'},
            \  {'mode': '<c-n>'}
            \]

let g:completion_enable_auto_hover = 1

let g:Completion_matching_smart_case = 1

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
nnoremap <leader>vrn :lua vim.lsp.buf.rename()<CR>
nnoremap <leader>vh :lua vim.lsp.buf.hover()<CR>
nnoremap <leader>vca :lua vim.lsp.buf.code_action()<CR>

" --- nvim web devicons
lua require'nvim-web-devicons'.setup()

" }}} 

" Treesitter {{{ 
lua require('treesitter-config')
" }}} 

