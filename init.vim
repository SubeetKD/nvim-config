call plug#begin('~/.config/nvim/plugged')

" lsp and autocomplete 
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-compe'
" Plug 'nvim-lua/completion-nvim'
Plug 'anott03/nvim-lspinstall'
Plug 'glepnir/lspsaga.nvim'

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

" REPL
Plug 'metakirby5/codi.vim'

" Which-key
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }

" File tree
Plug 'kyazdani42/nvim-tree.lua'

" snippets and commenter
Plug 'norcalli/snippets.nvim'
Plug 'b3nj5m1n/kommentary'

" Telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" Git config
Plug 'f-person/git-blame.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'tpope/vim-fugitive'
Plug 'stsewd/fzf-checkout.vim'

" note and language based tool
Plug 'alvan/vim-closetag'
Plug 'vimwiki/vimwiki'

" Visual improvements
Plug 'Yggdroot/indentLine'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} 
Plug 'norcalli/nvim-colorizer.lua'

" Distraction free writing.
Plug 'junegunn/goyo.vim'

" Statusline
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

" Searching
Plug 'romainl/vim-cool'

" Colorscheme
Plug 'sickill/vim-monokai'
Plug 'tomasr/molokai'
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'tjdevries/colorbuddy.vim'
Plug 'tjdevries/gruvbuddy.nvim'
Plug 'ayu-theme/ayu-vim'
Plug 'mhartington/oceanic-next'
Plug 'chriskempson/base16-vim'
Plug 'tomasiser/vim-code-dark'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'glepnir/zephyr-nvim'
Plug 'Th3Whit3Wolf/one-nvim'

call plug#end()

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
set guicursor=
set nu rnu

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

" Colorscheme

let g:molokai_original = 1
let g:rehash256 = 1
let g:onedark_termcolors = 256
let g:onedark_terminal_italics = 1
let g:ayucolor = "dark"
let g:gruvbox_contrast_dark = "hard"
let g:gruvbox_invert_selection='0'
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
let base16colorspace=256

set background=dark

" colorscheme ayu
" colorscheme one-nvim
" colorscheme base16-default-dark
" colorscheme dracula
" colorscheme onedark
" colorscheme codedark
" colorscheme zephyr
" colorscheme gruvbox
" lua require('zephyr').get_zephyr_color()
lua require('colorbuddy').colorscheme('gruvbuddy')

set t_Co=256
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

" highlight ColorColumn ctermbg=0 guibg=grey
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

lua require('subeet.treesitter')

lua require('subeet.snippets.snips')

lua require('subeet.lsp.index')

" nvim-compe useage

set completeopt=menu,menuone,noselect

let g:compe = {}
let g:compe.enabled = v:true
let g:compe.autocomplete = v:true
let g:compe.debug = v:false
let g:compe.min_length = 1
let g:compe.preselect = 'enable'
let g:compe.throttle_time = 80
let g:compe.source_timeout = 200
let g:compe.incomplete_delay = 400
let g:compe.allow_prefix_unmatch = v:false

let g:compe.source = {}
let g:compe.source.path = v:true
let g:compe.source.buffer = v:true
let g:compe.source.calc = v:true
let g:compe.source.vsnip = v:false
let g:compe.source.nvim_lsp = v:true
let g:compe.source.nvim_lua = v:true
let g:compe.source.spell = v:true
let g:compe.source.snippets_nvim = v:true

inoremap <silent><expr> <C-Space> compe#complete()
inoremap <silent><expr> <CR>      compe#confirm('<CR>')
inoremap <silent><expr> <C-e>     compe#close('<C-e>')

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Completion.nvim config

" set shortmess+=c
" set completeopt=menuone,noinsert,noselect
"
" inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
"
" let g:completion_enable_snippet = 'snippets.nvim'
" let g:completion_enable_auto_hover = 1
" let g:completion_enable_auto_paren = 0
" let g:completion_matching_smart_case = 1
" let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
" let g:completion_trigger_keyword_length = 2
" let g:completion_trigger_on_delete = 1
" let g:completion_timer_cycle = 200
" let g:completion_auto_change_source = 1
"
" autocmd BufEnter * lua require'completion'.on_attach()
" nnoremap <leader>lll <cmd>e ~/.local/share/nvim/lsp.log <cr>
" " Don't know if needed ~/home
" let g:completion_confirm_key = ""
" imap <expr> <cr>  pumvisible() ? complete_info()["selected"] != "-1" ?
                 " \ "\<Plug>(completion_confirm_completion)"  : "\<c-e>\<CR>" :  "\<CR>"

lua require('subeet.lsp.lspsaga')

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

lua require('subeet.statusline')

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

" Telescope.nvim Using lua functions
" TODO(SUBEET) --> make custom functions
nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
nnoremap <leader>fg <cmd>lua require('telescope.builtin').live_grep()<cr>
nnoremap <leader>fb <cmd>lua require('telescope.builtin').buffers()<cr>
nnoremap <leader>fh <cmd>lua require('telescope.builtin').help_tags()<cr>

" using default config 
" TODO(SUBEET) --> make custom config per file type
" lua require('nvim-autopairs').setup()


" Codi.vim
highlight CodiVirtualText guifg=cyan
let g:codi#virtual_text_prefix = "❯ "

" Git config

"Git status
nnoremap <leader>gs <cmd>G<cr> 
nnoremap <leader>gc <cmd>Gcommit<cr> 

" for resolving conflict
nnoremap <leader>gch <cmd>diffget //2<cr>
nnoremap <leader>gcl <cmd>diffget //3<cr>

let g:gitblame_message_template = '      <summary> • <date> • <author>'
lua require('subeet.gitsigns')


" Lua tree config
let g:nvim_tree_side = 'left' "left by default
let g:nvim_tree_width = 40 "30 by default
let g:nvim_tree_ignore = [ '.git', 'node_modules', '.cache' ] "empty by default
let g:nvim_tree_auto_open = 0 "0 by default, opens the tree when typing `vim $DIR` or `vim`
let g:nvim_tree_auto_close = 0 "0 by default, closes the tree when it's the last window
let g:nvim_tree_quit_on_open = 1 "0 by default, closes the tree when you open a file
let g:nvim_tree_follow = 1 "0 by default, this option allows the cursor to be updated when entering a buffer
let g:nvim_tree_indent_markers = 1 "0 by default, this option shows indent markers when folders are open
let g:nvim_tree_hide_dotfiles = 1 "0 by default, this option hides files and folders starting with a dot `.`
let g:nvim_tree_git_hl = 1 "0 by default, will enable file highlight for git attributes (can be used without the icons).
let g:nvim_tree_root_folder_modifier = ':~' "This is the default. See :help filename-modifiers for more options
let g:nvim_tree_tab_open = 1 "0 by default, will open the tree when entering a new tab and the tree was previously open
let g:nvim_tree_width_allow_resize  = 1 "0 by default, will not resize the tree when opening a file
let g:nvim_tree_show_icons = {
    \ 'git': 1,
    \ 'folders': 1,
    \ 'files': 1,
    \ }
"If 0, do not show the icons for one of 'git' 'folder' and 'files'
"1 by default, notice that if 'files' is 1, it will only display
"if nvim-web-devicons is installed and on your runtimepath

" You can edit keybindings be defining this variable
" You don't have to define all keys.
" NOTE: the 'edit' key will wrap/unwrap a folder and open a file
let g:nvim_tree_bindings = {
    \ 'edit':            ['<CR>', 'o'],
    \ 'edit_vsplit':     '<C-v>',
    \ 'edit_split':      '<C-x>',
    \ 'edit_tab':        '<C-t>',
    \ 'close_node':      ['<S-CR>', '<BS>'],
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
    \ 'dir_up':          '-',
    \ 'close':           'q',
    \ }

" Disable default mappings by plugin
" Bindings are enable by default, disabled on any non-zero value
" let nvim_tree_disable_keybindings=1

" default will show icon by default if no icon is provided
" default shows no icon by default
let g:nvim_tree_icons = {
    \ 'default': ' ',
    \ 'symlink': ' ',
    \ 'git': {
    \   'unstaged': "✗ ",
    \   'staged': "✓ ",
    \   'unmerged': " ",
    \   'renamed': "➜ ",
    \   'untracked': "★ "
    \   },
    \ 'folder': {
    \   'default': "",
    \   'open': "",
    \   'symlink': "",
    \   }
    \ }

nnoremap <C-n> :NvimTreeToggle<CR>
nnoremap <leader>r :NvimTreeRefresh<CR>
nnoremap <leader>n :NvimTreeFindFile<CR>
" NvimTreeOpen and NvimTreeClose are also available if you need them

set termguicolors " this variable must be enabled for colors to be applied properly

" a list of groups can be found at `:help nvim_tree_highlight`
highlight NvimTreeFolderIcon guibg=blue

nnoremap <silent> <leader> :WhichKey '<Space>'<CR>
